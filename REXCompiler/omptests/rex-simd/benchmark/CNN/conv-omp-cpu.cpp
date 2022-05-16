#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/timeb.h>
#include <float.h>

#include "omp.h"

#include "conv.h"


void conv(int batch, int M, int K, int N, int channels_col, int height_col, int width_col, int ksize, int stride, int channels, int height, int width, int pad, float *input, float *output, float *weights, float *B0) {
    int i, j, p, q, c, h, w;
    int w_offset, h_offset, c_im, row, col, col_index, out_index;
    float a_part;

    //double tmp, time_im2col, time_gemm;

    //tmp = read_timer_ms();
    // conv

    for (i = 0; i < batch; i++) {
	for (c = 0; c < channels_col; c++) {
            w_offset = c%ksize;
            h_offset = (c/ksize)%ksize;
            c_im     = (c/ksize)/ksize;
	    for (h = 0; h < height_col; h++) {
                #pragma omp simd 
                for (w = 0; w < width_col; w++) { // size: 10*28*28 = 16*490
                    row = h_offset + h*stride;
                    col = w_offset + w*stride;
                    out_index = i*channels*height*width + c_im*height*width + row*width + col;
                    col_index = i*channels_col*height_col*width_col + c*height_col*width_col + h*width_col + w;
                    row -= pad;
                    col -= pad;
                    if (row < 0 || col < 0 || row >= height || col >= width) {
                        B0[col_index] = 0.0;
                    } else {
                        B0[col_index] = input[out_index];
                    }
                    //printf("%d, %d\n", out_index, col_index);
                }
            }
	}
    }
 // parallel region 1

    //time_im2col = read_timer_ms() - tmp;
    //printf("conv-1   forward epoch# %d batch# %d device# %d: %lf\n", N, N, N, time_im2col);

    //tmp = read_timer_ms();



    for (i = 0; i < batch; i++) {
	for (p = 0; p < M; p++) {
            for (q = 0; q < K; q++) {
                a_part = weights[p*K+q];
    #pragma omp simd 
		for (j = 0; j < N; j++){ // size: 10*28*28 = 245*32
	            output[i*M*N+p*N+j] += a_part*B0[i*K*N+q*N+j];
		    //printf("%f, %f, %f\n", weights[p*K+q], B0[i*K*N+q*N+j], output[i*M*N+p*N+j]);
                }
            }
	}
    }
 // parallel region 2

    //time_gemm = read_timer_ms() - tmp;
    //printf("conv-2   forward epoch# %d batch# %d device# %d: %lf\n", N, N, N, time_gemm);

}

void bias(int batch, int M, int N, float *output, float *biases) {
    int b, p, q;


    // # of images
    for (b = 0; b < batch; b++) {
        // # of feature maps per image / otuput channels
        for (p = 0; p < M; p++) {
            // # of pixel per feature map
            #pragma omp simd 
            for (q = 0; q < N; q++) {
                output[b*M*N+p*N+q] += biases[p];
                //printf("%f\n", output[b*N*M+p*N+q]);
            }
        }
    }
// parallel region 1

}

void relu(int batch, int M, int N, float *output) {
    #pragma omp simd 
    for (int i = 0; i < batch*M*N; i++) {
        if (output[i] < 0) output[i] = 0.0001*output[i];
        //printf("%f\n", output[i]);
    }
 // parallel region 1
}

void max_pool(int batch, int height_out, int width_out, int ksize, int stride, int channels, int height, int width, int pad, float *input, float *output, int *indexes) {
    int b, k, i, j, n, m;
    int out_index, col_index, cur_h, cur_w;
    int max_i, valid;
    float max, val;


    for (b = 0; b < batch; b++) {
        for (k = 0; k < channels; k++) {
            for (i = 0; i < height_out; i++) {
                for (j = 0; j < width_out; j++) {
                    out_index = b*height_out*width_out*channels + k*height_out*width_out + i*width_out + j;
                    max = -FLT_MAX;
                    max_i = -1;
                    for (n = 0; n < ksize; n++) {
                        
                        for (m = 0; m < ksize; m++) {
                            cur_h = -pad + i*stride + n;
                            cur_w = -pad + j*stride + m;
                            col_index = b*height*width*channels + k*height*width + cur_h*width + cur_w;
                            valid = (cur_h >= 0 && cur_h < height && cur_w >= 0 && cur_w < width);
                            val = -FLT_MAX;
                            if (valid != 0) {val = input[col_index];}
                            if (val > max) {max = val; max_i = col_index;}
                            //printf("%d, %d\n", out_index, col_index);
                            //printf("%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d\n", b, k, i, j, m, n, height, width, channels, cur_h, cur_w);
                        }
                    }
                    output[out_index] = max;
                    indexes[out_index] = max_i;
                }
            }
        }
    }
// parallel region 1

}

void skip_connection(int batch, int M, int N, float *input, float *output) {
    int i, j, k;	
    int HWC_temp = batch*M*N;

    float *temp;
    temp = (float *)malloc(HWC_temp*sizeof(float));


    for (i = 0; i < batch; i++){
        for (j = 0; j < M; j++) {
            #pragma omp simd 
            for (k = 0; k < N; k++) {
                temp[i*M*N+j*N+k] = input[i*M/4*N*2+j/4*N*2+k*2];
            }
        }
    }
 // parallel region 1

    #pragma omp simd 
    for (i = 0; i < batch*M*N; i++){
        output[i] += temp[i];
    }
 // parallel region 2

}

void softmax(int batch, int N, float *input, float *output) {
    int b,i;
    float largest, sum;
    largest = -FLT_MAX;


    for (b = 0; b < batch; b++) {
        sum = 0;
        #pragma omp simd 
        for (i = 0; i < N; i++){
            if(input[b*N+i] > largest) largest = input[b*N+i];
        }
        //printf("largest: %f\n", largest);
        #pragma omp simd 
        for (i = 0; i < N; i++){
            float e = exp(input[b*N+i]-largest);
            //printf("e: %f\n", e);
            //printf("diff: %f\n", largest - input[b*N+i]);
            output[b*N+i] = e;
            sum += e;
        }
        //printf("sum: %f\n", sum);
        #pragma omp simd 
        for (i = 0; i < N; i++) {
            output[b*N+i] = output[b*N+i]/sum;
            //printf("%f ", output[b*N+i]);
        }
        //printf("\n");
    }
// parallel region 1

}

void softmax_backward(int batch, int N, float *input, float *output) {
    int i;
    #pragma omp simd 
    for (i = 0; i < batch*N; i++) {
        output[i] += input[i];
    }
// parallel region 1

}

void bias_backward(int batch, int N, int M, float *input, float *output) {
    int b, i, j;


    for (b = 0; b < batch; b++) {
        for (i = 0; i < N; i++) {
      #pragma omp simd
	    for (j = 0; j < M; j++) {
                output[j] += input[b*N*M+i*M+j];
            }
        }
    }
// parallel region 1

}

void max_pool_backward(int batch, int N, int M, int *indexes, float *delta_in, float *delta_out) {
    int i, index;

    #pragma omp simd
    for (i = 0; i < batch*N; i++) {
        index = indexes[i];
        delta_out[index] += delta_in[i];
    }
 // parallel region 1

}

void conv_backward(int batch, int M, int K, int N, int channels_col, int height_col, int width_col, int ksize, int stride, int channels, int height, int width, int pad, float *input, float *delta_in, float *weight_updates, float *delta_out, float *weights, float *B2b, float *B2g) {
    int i, j, k, b, c, h, w;
    int w_offset, h_offset, c_im, row, col, col_index, out_index;
    float sum, a_part;

    // conv
    
    for (b = 0; b < batch; b++) {
        for (c = 0; c < channels_col; c++) {
            w_offset = c%ksize;
            h_offset = (c/ksize)%ksize;
            c_im = (c/ksize)/ksize;
            for (h = 0; h < height_col; h++) {
                for (w = 0; w < width_col; w++) {
                    row = h_offset + h*stride;
                    col = w_offset + w*stride;
                    out_index = b*height*width*channels + c_im*height*width + row*width + col;
                    col_index = c*height_col*width_col + h*width_col + w;
                    row -= pad;
                    col -= pad;
                    if (row < 0 || col < 0 || row >= height || col >= width) {
                        B2b[col_index] = 0.0;
                    } else {
                        B2b[col_index] = input[out_index];
                    }
                }
            }
        }
    }
 // parallel region 1

    // gemm

    for (b = 0; b < batch; b++) {
        for (i = 0; i < M; i++) {
            for (j = 0; j < N; j++) {
                sum= 0;
                #pragma omp simd
                for (k = 0; k < K; k++) {
                    sum += delta_in[b*N*K+j*K+k]*B2b[i*K+k];
                }
                weight_updates[i*N+j] += sum;
            }
        }
    }
 // parallel region 2

    // gemm2

    for (b = 0; b < batch; b++) {
        for (i = 0; i < N; i++) {
            for (j = 0; j < M; j++) {
                a_part = weights[i*M+j];
                #pragma omp simd
                for (k = 0; k < K; k++) {
                    B2g[j*N*K+i*K+k] += a_part*delta_in[b*N*K+i*K+k];
                }
            }
        }
    }
 // parallel region 3

    // de-conv
    // col2im_cpu(net.workspace, l.c/l.groups, l.h, l.w, l.size, l.stride, l.pad, imd);

    for (b = 0; b < batch; b++) {            
        for (c = 0; c < channels_col; c++) {
            w_offset = c%ksize;
            h_offset = (c/ksize)%ksize;
            c_im     = c/ksize/ksize;
            for (h = 0; h < height_col; h++) {
                #pragma omp simd
                for (w = 0; w < width_col; w++) {
                    row = h_offset + h * stride;
                    col = w_offset + w * stride;
                    out_index = b*height*width*channels + c_im*height*width + row*width + col;
                    col_index = c*height_col*width_col + h*width_col + w;
                    row -= pad;
                    col -= pad;
                    if (!(row < 0 || col < 0 || row >= height || col >= width)) {
                        delta_out[out_index] += B2g[col_index];
                    }
                }
            }
        }
    }
// parallel region 4

}


void conv_update(int nbias, float *biases, float *bias_updates, int nweights, float *weights, float *weight_updates, float p1, float p2, float p3) {
    // axpy
    for (int i = 0; i < nbias; i++) {biases[i] += p1*bias_updates[i]; /*printf("%lf\n", bias_updates[i]);*/}
    // scale
    for (int i = 0; i < nbias; i++) {bias_updates[i] *= p3;}
    // axpy
    for (int i = 0; i < nweights; i++) {weight_updates[i] += p2*weights[i];}
    // axpy2
    for (int i = 0; i < nweights; i++) {weights[i] += p1*weight_updates[i];}
    // scale
    for (int i = 0; i < nweights; i++) {weight_updates[i] *= p3;}
}



