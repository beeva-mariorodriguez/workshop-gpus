#include <opencv2/opencv.hpp>

using namespace std;
using namespace cv;

/* __global__ specifier tells the CUDA C++ compiler that this is a function 
	that runs on the GPU and can be called from CPU code. 
 */

__global__
void rgb2grayGPU_kernel(const uchar3* const dev_rgb_image,
                       unsigned char* const dev_gray_image,
                       int num_rows, int num_cols)
{
	uchar R, G, B;

	// Calculate the index of the pointers based on pixel location for each thread
    int x = blockIdx.x * blockDim.x + threadIdx.x; //x coordinate of pixel
    int y = blockIdx.y * blockDim.y + threadIdx.y; //y coordinate of pixel

    if ((x >= num_cols) && (y >= num_rows)) 
    {
        return;
    }

    int index = y*num_cols + x; //absolute pixel position
    uchar3 pixel = dev_rgb_image[index];

	B = pixel.x;
	G = pixel.y;
	R = pixel.z;

	dev_gray_image[index] = (uchar)(0.299*R + 0.587*G + 0.114*B);
}


Mat rgb2grayGPU(Mat rgb_image)
{
  	const int num_rows = rgb_image.rows;
  	const int num_cols = rgb_image.cols;
  	const int total_pixels = num_rows*num_cols;


	/* Adapt image format and copy to device */
	/*****************************************/

	uchar3 *host_rgb_image = (uchar3 *)rgb_image.ptr<unsigned char>(0);

	uchar3 *device_rgb_image;
	unsigned char *device_gray_image;

	cudaMalloc(&device_rgb_image, sizeof(uchar3) * total_pixels);
	cudaMalloc(&device_gray_image, sizeof(unsigned char) * total_pixels);

	cudaMemset(device_gray_image, 0, total_pixels * sizeof(unsigned char));

	 //copy input array to the GPU
	cudaMemcpy(device_rgb_image, host_rgb_image, sizeof(uchar3) * total_pixels, cudaMemcpyHostToDevice);


	/* Execute kernel in GPU */
	/*************************/

	const int thread = 16;
	const dim3 blockSize( thread, thread);
  	const dim3 gridSize( ceil(num_cols/(float)thread) + 1, ceil(num_rows/(float)thread) + 1);

	rgb2grayGPU_kernel<<<gridSize, blockSize>>>(device_rgb_image, device_gray_image, num_rows, num_cols);

	// Wait for GPU to finish before accessing on host
	cudaDeviceSynchronize();


	/* Gather image from device and free memory */
	/********************************************/
	Mat host_gray_image(num_rows, num_cols, CV_8UC1, Scalar(0));
	cudaMemcpy(host_gray_image.ptr<unsigned char>(0), device_gray_image, sizeof(unsigned char) * total_pixels, cudaMemcpyDeviceToHost);

	cudaFree(device_rgb_image);
	cudaFree(device_gray_image);


	return host_gray_image;
}


