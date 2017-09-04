cmake_minimum_required(VERSION 3.5)
project(rgb2gray)
find_package(OpenCV REQUIRED)
find_package(CUDA REQUIRED)

cuda_add_executable(rgb2gray
					main.cpp
					rgb2gray.h
					rgb2gray.cu)

target_link_libraries( rgb2gray ${OpenCV_LIBS} )