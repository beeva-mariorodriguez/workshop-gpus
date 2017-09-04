#include <opencv2/opencv.hpp>

using namespace std;
using namespace cv;

Mat rgb2grey(Mat rgb_image)
{
	Mat gray;
	cvtColor(rgb_image, gray, CV_BGR2GRAY);
	return gray;
}