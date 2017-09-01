#!/bin/sh

mkdir build
cd build
cmake ..
make
./rgb2grey ../cat.jpg ../cat2.jpg MODE_CPU
