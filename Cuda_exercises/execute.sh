#!/bin/sh

mkdir build
cd build
cmake ..
make
./rgb2gray ../cat.jpg ../cat2.jpg MODE_CPU DISPLAY_OFF
