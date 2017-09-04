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
* Ratings, 10M of ratings (not all ratings have users linked).
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

