
Ejecucion en CPU
================

1.
```bash
ubuntu@ip-172-30-0-238:~/Cuda_exercises/build$ time ./rgb2gray ../cat.jpg ../cat2.jpg MODE_CPU DISPLAY_OFF

real    0m0.019s
user    0m0.008s
sys     0m0.011s
```

Ejecucion en GPU
================

1.
```bash
ubuntu@ip-172-30-0-238:~/Cuda_exercises/build$ time ./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF

real    0m2.765s
user    0m0.011s
sys     0m0.409s
```

2.
```bash
ubuntu@ip-172-30-0-238:~/Cuda_exercises/build$ time ./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF

real    0m0.088s
user    0m0.021s
sys     0m0.066s
```

3.
```bash
ubuntu@ip-172-30-0-238:~/Cuda_exercises/build$ time ./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF

real    0m0.098s
user    0m0.013s
sys     0m0.076s
```

4.
```bash
ubuntu@ip-172-30-0-238:~/Cuda_exercises/build$ time ./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF

real    0m0.080s
user    0m0.016s
sys     0m0.064s
```

5.
```bash
ubuntu@ip-172-30-0-238:~/Cuda_exercises/build$ time ./rgb2gray ../cat.jpg ../cat2.jpg MODE_GPU DISPLAY_OFF

real    0m0.081s
user    0m0.024s
sys     0m0.055s
```
