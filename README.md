# workshop-gpus
Materials for BEEVA Labs workshop on GPUs

access instructions
* each group will have access to a AWS GPU instance (we will provide the IP and private key)
* to access the instance:
  ```bash
  ssh -i workshop2017.pem ubuntu@<IP>
  ```
* to access the instance, enabling port redirection for jupyter notebook and mapd
  ```bash
  ssh -L 8888:127.0.0.1:8888 -L 9092:127.0.0.1:9092 -i workshop2017.pem ubuntu@<IP>
  ```

Content:
* Module 1:
  * [From RGB to gray](./minpy-exercise): minpy code to test CPU and GPU implementation of an algorithm that converts images from RGB to gray.
  * [[Optional] CIFAR10 on Mxnet](https://github.com/apache/incubator-mxnet): exercises with images to learn about bottlenecks in GPU.
 
* Module 2:
  * [Cuda_exercises](./Cuda_exercises): exercises in C++ for showing multithreaded CUDA programming
* Module 3:
  * [MapD exercise](https://github.com/beeva-enriqueotero/beeva-poc-mapd)
  * [Optional] BlazingDB on AWS p2.x. SSB Example
  * [PyGDF_exercises](./PyGDF_exercises): exercises in Python to show PyGDF performance compared to Pandas
* Module 4:
  * [infrastructure](./infrastructure)
* Module 5:
  * [Seq2Seq](./keras-exercise): Neural Machine Translation in Keras
  * [[Optional] Minpy vs Numpy](https://github.com/beeva-albertorincon/beeva-poc-minpy)
  * [[Optional] Tensorflow MNIST on Floydhub](https://github.com/beeva-ricardoguerrero/Floydhub_experiments)
* Extra:
  * [CIFAR10 on Mxnet](https://github.com/beeva-enriqueotero/beeva-poc-mxnet/blob/master/README_cifar.md)
  * [CIFAR10 on Tensorflow](https://github.com/tensorflow/models/tree/master/tutorials/image/cifar10_estimator)

