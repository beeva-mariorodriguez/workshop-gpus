#!/bin/bash
DEST=${1:-.}
mkdir -p "$DEST"
cd "$DEST"
wget http://files.grouplens.org/datasets/movielens/ml-1m.zip
wget http://files.grouplens.org/datasets/movielens/ml-10m.zip
wget http://files.grouplens.org/datasets/movielens/ml-20m.zip

mkdir -p "${HOME}/pygdf/input_files/"

unzip ml-1m.zip ml-1m/ratings.dat
cp ml-1m/ratings.dat "${HOME}/pygdf/input_files/ratings-1M.dat"

unzip ml-10m.zip ml-10M100K/ratings.dat
cp ml-10M100K/ratings.dat "${HOME}/pygdf/input_files/ratings-10M.dat"

unzip ml-20m.zip ml-20m/ratings.csv
cp ml-20m/ratings.csv "${HOME}/pygdf/input_files/ratings-20M.dat"

