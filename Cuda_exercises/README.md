### Compile
```
# chmod +x execute.sh
./execute.sh
```

### Execute
```
cd build
./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF
```

### Profile
```
time ./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF
nvprof ./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF
# Export to file
nvprof -o rgb2gray.nvprof ./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF
# Import with Nvidia Visual Profiler (nvvp)
```
Note: you can use nvvp remote, through X forwarding, or install nvvp in your machine.
