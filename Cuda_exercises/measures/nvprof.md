```bash
ubuntu@ip-172-30-0-238:~/Cuda_exercises/build$ nvprof ./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF
==2268== NVPROF is profiling process 2268, command: ./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF
==2268== Profiling application: ./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF
==2268== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 57.77%  114.81us         1  114.81us  114.81us  114.81us  [CUDA memcpy HtoD]
 20.53%  40.799us         1  40.799us  40.799us  40.799us  [CUDA memcpy DtoH]
 16.28%  32.351us         1  32.351us  32.351us  32.351us  rgb2grayGPU_kernel(uchar3 const *, unsigned char*, int, int)
  5.43%  10.784us         1  10.784us  10.784us  10.784us  [CUDA memset]

==2268== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.94%  1.35782s         2  678.91ms  77.472us  1.35774s  cudaMalloc
  0.02%  268.48us         2  134.24us  124.43us  144.05us  cudaMemcpy
  0.01%  176.32us         2  88.161us  69.901us  106.42us  cudaFree
  0.01%  134.57us        83  1.6210us     222ns  52.756us  cuDeviceGetAttribute
  0.01%  126.54us         1  126.54us  126.54us  126.54us  cudaDeviceSynchronize
  0.00%  30.511us         1  30.511us  30.511us  30.511us  cudaMemset
  0.00%  24.883us         1  24.883us  24.883us  24.883us  cudaLaunch
  0.00%  17.221us         1  17.221us  17.221us  17.221us  cuDeviceGetName
  0.00%  11.251us         1  11.251us  11.251us  11.251us  cuDeviceTotalMem
  0.00%  2.5300us         2  1.2650us     663ns  1.8670us  cuDeviceGetCount
  0.00%  2.2270us         4     556ns     265ns     929ns  cudaSetupArgument
  0.00%  1.4300us         1  1.4300us  1.4300us  1.4300us  cudaConfigureCall
  0.00%     676ns         2     338ns     258ns     418ns  cuDeviceGet
```