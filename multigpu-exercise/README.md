# Train ConvNets on CIFAR10

Infrastructure: Deep Learning AMI 2.3 Ubuntu on AWS

## Tensorflow
See https://github.com/tensorflow/models/tree/master/tutorials/image/cifar10_estimator

## MxNet

### Train on CPU
```
cd ~/src/mxnet
python ./example/image-classification/train_cifar10.py --gpus 0 --num-epochs 12 --network resnet --num-layers 50
```
### Train on 1 GPU
```
python ./example/image-classification/train_cifar10.py --gpus 0 --num-epochs 12 --network resnet --num-layers 50
```

### GPU and CUDA profiling
```
nvprof -f -o cifar10.nvprof python ./example/image-classification/train_cifar10.py --gpus 0,1,2,3,4,5,6,7 --num-epochs 1 --network resnet --num-layers 50
# For GPU utilization see nvidia-smi or nvidia-settings -q GPUUtilization
```

### Tuning
Tune batch size and learning rate
```
python ./example/image-classification/train_cifar10.py --gpus 0,1,2,3,4,5,6,7 --num-epochs 12 --network resnet --num-layers 50 --batch-size 2048 --lr=0.4
