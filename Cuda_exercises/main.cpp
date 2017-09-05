#include <iostream>
#include <fstream>
#include <opencv2/opencv.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui.hpp>

#include "rgb2gray.h"

//#define DISPLAY_ON

using namespace std;
using namespace cv;


void check_arguments(int argc, char* argv[]);
void check_paths(char* argv[]);
Mat rgb2grayCPU(Mat color_image);


int main(int argc, char*argv[])
{
	check_arguments(argc, argv);
	check_paths(argv);

	string path2rgb = argv[1];
	string path2gray = argv[2];
	string mode = argv[3];
	string display_mode = argv[4];

	Mat rgb_image, gray_image;

	rgb_image = imread(path2rgb, CV_LOAD_IMAGE_COLOR);

	if(mode == string("MODE_CPU"))
		gray_image = rgb2grayCPU(rgb_image);
	else
		gray_image = rgb2grayGPU(rgb_image); // CUDA part

	// Display
	if (display_mode == string("DISPLAY_ON"))
	{
		namedWindow("RGB image", WINDOW_AUTOSIZE );
		imshow("RGB image", rgb_image);
		namedWindow("gray image", WINDOW_AUTOSIZE );
		imshow("gray image", gray_image);
		waitKey(0);
	}

	// Write result
	imwrite(path2gray, gray_image);
}




void check_arguments(int argc, char* argv[])
{
	string usage_instructions = "Usage instructions: ";
	usage_instructions += argv[0];
	usage_instructions += " path/to/color_image.jpg path/to/gray_image.jpg MODE_CPU / MODE_GPU";

	// make sure the user has provided input and output files
	if (argc != 5)
	{
		cerr << usage_instructions << endl;
		exit(EXIT_FAILURE);
	}

	if (string(argv[3]) != "MODE_CPU" && \
		string(argv[3]) != "MODE_GPU" )
	{
		cerr << usage_instructions << endl;
		exit(EXIT_FAILURE);
	}

	if (string(argv[4]) != "DISPLAY_ON" && \
		string(argv[4]) != "DISPLAY_OFF" )
	{
		cerr << usage_instructions << endl;
		exit(EXIT_FAILURE);
	}
}



void check_paths(char* argv[])
{
	string usage_instructions = "Usage instructions: ";
	usage_instructions += argv[0];
	usage_instructions += " path/to/color_image.jpg path/to/gray_image.jpg";

	// Try to open input image
	ifstream in_file(argv[1], ifstream::in);
	
	if(!in_file.is_open())
	{
		cerr << "Cannot open input file." << endl;
		exit(EXIT_FAILURE);
	}

	in_file.close();

	// Try to open/create ouput image
	ofstream out_file(argv[2], ofstream::out); // TODO check!!

	if(!out_file.is_open())
	{
		cerr << "Cannot open output file." << endl;
		exit(EXIT_FAILURE);
	}

	out_file.close();
}


// OpenCV way, not used in this exercise.
// The implementation is shown for didactic purposes

/*
Mat rgb2grayCPU(Mat rgb_image)
{
	Mat gray;
	cvtColor(rgb_image, gray, CV_BGR2GRAY);
	return gray;
}*/


Mat rgb2grayCPU(Mat rgb_image)
{
	Mat gray(rgb_image.rows, rgb_image.cols, CV_8UC1, Scalar(0));
	Vec3b pixel;
	uchar R, G, B;
	
	for(int i=0; i<rgb_image.rows; i++)
	{
		for(int j=0; j<rgb_image.cols; j++)
		{
			pixel = rgb_image.at<Vec3b>(i,j);

			// Remember, OpenCV returns BGR values
			B = pixel.val[0];
			G = pixel.val[1];
			R = pixel.val[2];

			gray.at<uchar>(i,j) = 0.299*R + 0.587*G + 0.114*B;
		}
	}

	return gray;
}