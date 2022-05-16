# CNN_in_one_page
This is originally used as test case for REX compiler involving `#pragma omp target`, however, for now it is also used for performance analysis of OpenMP offloading features.

#### Compile and Run
You need to put the original MNIST dataset for training and testing

```
make
```

```
export LD_LIBRARY_PATH=/opt/llvm/llvm-14.x-install/lib:$LD_LIBRARY_PATH
make run
```

#### Code Structure:

```
// classifier_rex_omp.cpp
// data processing
...

// training
while (epoch) {
    for (batch_size) {
        forward(network);
        backward(network);
        update(network);
    }
}

//testing
...
```

#### Omp Target Notes

[Omp Target Ver. illustration](https://github.com/ambipomyan/Wikipages/wiki/Omp-target-code-example)

#### Detailed Code Structure

```
void run_classifier() {

	if ("train") {

		itr = 0;
		
		while(itr < epoch) {

			int batch_col = network->batch;
			int n_col = d->X->nrows/batch_col;
			float sum_col = 0;
			
			//train network		
			for (int i_col = 0; i_col < n_col; i_col++) {
				
				
				//get_next_batch
				for (int i = 0; i < batch_col; i++) { } 
				//get_next_batch ends
				
			
				//forward network
				for (int l = 0; l < network->n; l++) {
			
					//fill layer->delta
					int N;
					for (int i = 0; i < N; i++) { }
					
					//layer->forward
					if (CONVOLUTIONAL) {

						//fill layer->output
						int N;
						for (int i = 0; i < N; i++) { }
						
						int m, k, n;

						for (int i = 0; i < layer->batch; i++) {	
							for (int j = 0; j < layer->groups; j++) {

								float *a, *b, *c, *im;
								
								//im2col
								if (layer->size==1) {
									b = im;
								} else {
									//...
									for (int cc = 0; cc < channels_col; cc++) {
										//...
										for (int hh = 0; hh < height_col; hh++) {
											for (int ww = 0; ww < width_col; ww++) {
												
											}
										}
									}
								}
								
								//gemm
								for (int ii = 0; ii < m; ii++) {
									for (int kk = 0; kk < k; kk++) {
										float a_part = a[ii*k+kk];
										for (int jj = 0; jj < n; jj++) {
											c[ii*n+jj] += a_part*b[kk*n+jj];
										}
									}
								}	

							}
						}

						//add bias
						for(int b = 0; b < layer->batch; b++){
                            				for(int i = 0; i < layer->n; i++){
                                					for(int j = 0; j < layer->out_h*layer->out_w; j++){
                                    					layer->output[(b*layer->n+i)*layer->out_h*layer->out_w+j] += layer->biases[i];
                                					}
                            				}
                        				}

						//activate array
						for (int i = 0; i < layer->outputs*layer->batch; i++){
							layer->output[i] = layer->output[i]*(layer->output[i]>0);
						}
				

					} else if (CONNECTED) {

						//fill layer->output
                        				int N;
                        				for (int i = 0; i < N; i++) { }

						int m, n, k;
						float *a, *b, *c;

						//gemm
						for(int ii = 0; ii < m; ii++){
                            				for(int jj = 0; jj < n; jj++){
								float sum = 0;
                               		 			for(int kk = 0; kk < k; kk++){
                                    					sum += a[ii*k+kk]*b[jj*k+kk];
                                					}
								c[ii*n+jj] += sum;
                           	 			}
                        				}

						//add bias
						for(int b = 0; b < layer->batch; b++){
                            				for(int i = 0; i < layer->outputs; i++){
                                					layer->output[b*layer->outputs+i] += layer->biases[i];
                            				}
                        				}

						//active array
						for (int i = 0; i < layer->outputs*layer->batch; i++){
                            				layer->output[i] = layer->output[i]*(layer->output[i]>0);
                        				}

					} else if (MAXPOOL) {

						int w_offset, h_offset;
						int h, w, c;
						
						for (int b = 0; b < layer->batch; b++) {
							for (int k = 0; k < c; k++) {
								for (int i = 0; i < h; i++) {
									for (int j = 0; j < w; j++) {
										//...
										for (int n = 0; n < layer->size; n++) {
											for (int m = 0; m < layer->size; m++) {

											}
										}
										//...
									}
								}
							}
						}
						
					} else if (SOFTMAX) {

						//softmax
						for (int b = 0; b < layer->batch; b++) {
							for (int g = 0; g < layer->groups; g++) {

								int n;
								float sum, largest, *input, *output;
								
								for (int i = 0; i < n; i++) { }

								for (int i = 0; i < n; i++) { }

								for (int i = 0; i < n; i++) { }
							}
						}

						//softmax_x_ent
						int n;
						for (int i = 0; i < n; i++) { }

						//sum_array
						layer->cost[0] = 0;
						for (int i = 0; i < n; i++) { }

					}

				}

				//update network cost
				
				float sum;
				int count;
				for (int l = 0; l < network->n; l++) { }
				//forward ends			


				//backward network
				for (int l = (network->n)-1; l >= 0; l--) {
			
					//layer->backward
					if (CONVOLUTIONAL) {

						int m, n, k;

						//gradient array
						for(int i = 0; i < layer->outputs*layer->batch; i++){ }

						//backward_bias(layer->bias_updates, layer->delta, layer->batch, layer->n, k);
                        				for (int i = 0; i < layer->n; i++) {
                            				//sum_array
                            				float sum = 0;
                            				for (int b = 0; b < layer->batch; b++) {
                                					for (int j = 0; j < k; j++) {
                                    					sum += layer->delta[k*(i+b*layer->n)+j];
                                					}
                            				}
                            				layer->bias_updates[i] += sum;
                        				}
						
						for (int i = 0; i < layer->batch; i++) {
							for (int j = 0; j < layer->groups; j++) {
								
								float *a, *b, *c, *im, *imd;
								
								if (layer->size == 1) {
									b = im;
								} else {
									//im2col
									//...
									for (int cc; cc < channels_col; cc++) {
										//...
										for (int hh = 0; hh < height_col; hh++) {
											for (int ww = 0; ww < width_col; ww++) {
												
											}
										}
									}
								}
								
								//gemm(0,1)
								for(int ii = 0; ii < m; ii++){
                                    					for(int jj = 0; jj < n; jj++){
										float sum;
                                        						for(int kk = 0; kk < k; kk++){
                                            						sum += a[ii*k+kk]*b[jj*k+kk];
                                        						}
									        c[ii*n+jj] += sum; 
                                    					}
                                					}

								if (network->delta) {
									//a,b,c

									//gemm(1,0,n,k,m,1,a,n,b,k,0,c,k)
									for (int ii = 0; ii < n; ii++) {
										for (int kk = 0; kk < m; kk++) {
											float a_part = a[kk*n+ii];
											for (int jj = 0; jj < k; jj++) {
												c[ii*k+jj] += a_part*b[kk*k+jj];
											}
										}
									}
									
									if (layer->size != 1) {
										//col2im
										//...
										for (int cc) {
											//...
											for (int hh) {
												for (int ww) {
													
												}
											}
										}
									}
								}	
							}
						}

					} else if (CONNECTED) {

						//gradient array
						for(int i = 0; i < layer->outputs*layer->batch; i++){
                            				layer->delta[i] *= (layer->output[i]>0);
                        				}
						
						//backward_bias(layer->bias_updates, layer->delta, layer->batch, layer->outputs, 1);
                        				for (int i = 0; i < layer->outputs; i++) {
                            				for (int b = 0; b < layer->batch; b++) {
                                    				layer->bias_updates[i] += layer->delta[i+b*layer->outputs];
							}
                            				
                        				}

						int m, k, n;
						float *a, *b, *c;

						//gemm(1,0)					
						for (int ii = 0; ii < m; ii++) {
							for (int kk = 0; kk < k; kk++) {
								float a_part = a[kk*m+ii];
								for (int jj = 0; jj < n; jj++) {
									c[ii*n+jj] += a_part*b[kk*n+jj];
								}
							}
						}

					        	//m, n, k, a, b, c...
						if (c) {
							//gemm(0,0,m,n,k,1,a,k,b,n,1,c,n);
							for (int ii = 0; ii < m; ii++) {
								for (int kk = 0; kk < k; kk++) {
									float a_part = a[ii*k+kk];
									for (int jj = 0; jj < n; jj++) {
										c[ii*n+jj] += a_part*b[kk*n+jj];
									}
								}
							}
						}

					} else if (MAXPOOL) {

						int h, w, c;

						for(int i = 0; i < h*w*c*layer->batch; i++){
							int index = layer->indexes[i];
							network->delta[index] += layer->delta[i];
						}
						
					} else if (SOFTMAX) {

						//axpy(layer->inputs*layer->batch, 1, layer->delta, 1, network->delta, 1);
						for (int i = 0; i < layer->inputs*layer->batch; i++) network->delta[i] += layer->delta[i]

					}
				}
				//backward ends

				float error_col = network->cost[0];

				//update network
				if((*network->seen)/network->batch%network->subdivisions == 0) {
           				
					for (int l = 0; l < network->n; l++) {

						if (CONVOLUTIONAL) {
							//axpy
							for (int i = 0; i < layer->n; i++) { }

							//scal
							for (int i = 0; i < layer->n; i++) { }

							//axpy
							for (int i = 0; i < layer->nweights; i++) { }

							//axpy
							for (int i = 0; i < layer->nweights; i++) { }

							//scal
							for (int i = 0; i < layer->nweights; i++) { }
						

						} else if (CONNECTED) {
							//axpy
							for (int i = 0; i < layer->outputs; i++) { }

							//scal
							for (int i = 0; i < layer->outputs; i++) { }

							//axpy
							for (int i = 0; i < layer->inputs*layer->outputs; i++) { }

							//axpy
							for (int i = 0; i < layer->inputs*layer->outputs; i++) { }

							//scal
							for (int i = 0; i < layer->inputs*layer->outputs; i++) { }

						}

					}
			
				}
				// update ends

				sum_col += error_col;
			
			} //train network ends
			
			printf("error: %f\n", sum_col/(n_col*batch_col));
			
			itr++;
		
		} //while loop ends
	
	} else if ("test") {
		
		//test_network
	
	}

}
```
