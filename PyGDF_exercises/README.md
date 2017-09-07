
# PyGDF

## Presentation

High Performance Computing in GPU-level is booming due to  ability to solve complex problems in reduced times. It is time to research new tools and data structure.

These exercises are focused Python tools working with data structures in GPU-level.

The goal is to research about GDF and how it works in a Python ecosystem and make comparison between Pandas and PyGDF performance.

## Introduction

### What is GDF?

GDF (Gpu Data Frame) is the first step of [GOAI](https://github.com/gpuopenanalytics)  to build an end-to-end platform GPU-level. It's a data structure that allows data interchanging process running in GPU to achieve reduce latency to trasnferring data from/to CPU disappears.


### What is PyGDF?

PyGDF is an GDF api implementation in Python because currently, thet don't support pip install yet. So you should setup with conda (don't worry because environment to run exercises is fully configured).


## Experiments

Experiments you will be run are divide in three diferents blocks:
 * **Statistical operations through** columns (Count, Maximum, Minimum, Mean and Standard deviation).
 * **Filter(Select-Where) operations with conditions in two columns** (The best and the worst movies in years 1995, 2000 and 2005).
 * **Join operations between two datasets**. (left, right, inner and outer)
 
Pandas code are optimized to get the best performance.

You will use two datasets that are structures with information about users, movies and rating that users assign to each movie, see example below:

* Users, 6K of users.
```
 user_id    age    ocupation     zip
    1        1        10        48067
    2        56       16        70072
    3        25       15        55117
    4        45       7         02460
    5        25       20        55455
    6        50       9         55117
    7        35       1         06810
    8        25       12        11413
    9        25       17        61614
    10       35       1         95370
```
* Ratings, 1, 10M and 20M of ratings (not all ratings have users linked).
```
 user_id  movie_id  rating  timestamp
    1      1193       5     978300760
    1       661       3     978302109
    1       914       3     978301968
    1      3408       4     978300275
    1      2355       5     978824291
    1      1197       3     978302268
    1      1287       5     978302039
    1      2804       5     978300719
    1       594       4     978302268
    1       919       4     978301368
```

## How to run these exercises

* Log in in AWS and use Norht Virginia region.
* Go to EC2 dashboard and selec the ami named pygdf-gpu-jupyter.
* Launch a Spot instace type p2.xlarge for GPU computing.
* In step 3 of launch wizard configure this:

```
Network: vpc-4235113b | poc-pygdf
Auto-assign Public IP : Enable
```

* In step 6 of launch wizard selec *security group : sg-b14ccfc1 | poc-pygdf*
* Finally launch instance an create a key pair to connect it.
* Connect to instance via ssh (use user 'ubuntu' instead of root or ec2user) and execute this code in terminal:


```
cd /home/ubuntu/pygdf/notebooks/
jupyter notebook --certfile=/home/ubuntu/ssl/cert.pem --keyfile /home/ubuntu/ssl/cert.key
```

* Jupyter server is running on your instance, now you need to connect it via https to run exercises.
* Open your browser and connect to instance host via https in port 9999 (e.g. https://ec2-54-234-180-164.compute-1.amazonaws.com:999) You should add an security exception. And type password *beevajupyter* in log in form.
* You can watch a tree folder with 3 directories. Please access to foler in this order (columnar_operations, select-where_operations and join_operations) and run the exercises in order you watch. Before run each cells, wait cell before is finished.
* Is very importante you choose kernel Python 3 PyGDF for each exercise.
* In each exercise you could compare timine to run the same process in Pandas and PyGDF (copy and paste each output in a text file to whatc comparison better, if you want and save it beacuse in next exercise you run only Pandas code in a CPU optimized instance and you could compare to this results)


* Now Launch a new instance (follow the same steps before with the same AMI and configuration). But in this case select c4.4xlarge instance type ompitzed for compute.
* Launch exercises again but only pandas functions (comment pygdf functions)








