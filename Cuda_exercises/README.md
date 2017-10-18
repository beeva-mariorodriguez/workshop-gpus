
## 01 CUDA
Compile the code.
```bash
cd ~/workshop-gpus/Cuda_exercises
chmod +x execute.sh
./execute.sh
```
Profile the code.
```bash
cd build
time ./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF
nvprof ./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF # Export to file nvprof -o rgb2gray.nvprof ./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF
```
