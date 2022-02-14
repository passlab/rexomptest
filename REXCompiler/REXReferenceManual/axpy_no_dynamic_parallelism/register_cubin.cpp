#include <stdio.h>
#include <stdlib.h>
#include "omptarget.h"

// clang++ -g -c register_cubin.cpp -I${LLVM_SRC}/openmp/libomptarget/include -o register_cubin.o

#ifdef __cplusplus
extern "C" {
#endif

struct __tgt_bin_desc* register_cubin(char* filename, void* __start_offloading_entries, void* __stop_offloading_entries) {

    // restore the pointer type from void
    struct __tgt_offload_entry *__start_omp_offloading_entries = (struct __tgt_offload_entry *)__start_offloading_entries;
    struct __tgt_offload_entry *__stop_omp_offloading_entries = (struct __tgt_offload_entry *)__stop_offloading_entries;

    //read cuda object file to char array
    FILE * file = fopen(filename, "r+");
    if (file == NULL) {
        return NULL;
    };
    fseek(file, 0, SEEK_END);
    long int size = ftell(file);
    fclose(file);
    // Reading data to array of unsigned chars
    file = fopen(filename, "r+");
    unsigned char* image = (unsigned char *) malloc(size);
    int bytes_read = fread(image, sizeof(unsigned char), size, file);
    fclose(file);

    /* init struct __tgt_device_image */
    struct __tgt_device_image * device_image = (struct __tgt_device_image*)malloc(sizeof(struct __tgt_device_image));
    device_image->ImageStart = image;
    device_image->ImageEnd = image + size;
    device_image->EntriesBegin = __start_omp_offloading_entries;
    device_image->EntriesEnd = __stop_omp_offloading_entries;

    struct __tgt_bin_desc * bin_desc = (struct __tgt_bin_desc*)malloc(sizeof(struct __tgt_bin_desc));

    bin_desc->NumDeviceImages = 1;
    bin_desc->DeviceImages = device_image;
    bin_desc->HostEntriesBegin = __start_omp_offloading_entries;
    bin_desc->HostEntriesEnd = __stop_omp_offloading_entries;

    __tgt_register_lib(bin_desc);
    return bin_desc;
}

#ifdef __cplusplus
}
#endif
