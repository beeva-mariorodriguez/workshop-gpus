#!/bin/bash
MODULE1="${HOME}/module1"
MODULE3="${HOME}/module3"
MODULE5="${HOME}/module5"
git clone https://github.com/beeva-labs/workshop-gpus

# module1
mkdir -p "$MODULE1"
git clone https://github.com/beeva-albertorincon/beeva-poc-minpy "${MODULE1}/beeva-poc-minpy"
git clone https://github.com/apache/incubator-mxnet "${MODULE1}/incubator-mxnet"

# module3 pygdf
mkdir -p "$MODULE3"
git clone https://github.com/beeva-enriqueotero/beeva-poc-mapd "${MODULE3}/beeva-poc-mapd"
## mapd sample data
mv download_mapd_sample_data.sh "${MODULE3}"
## miniconda
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b
## pygdf
cd src
git clone https://github.com/gpuopenanalytics/pygdf
cd pygdf
git checkout tags/v0.1.0a2
"${HOME}"/miniconda3/bin/conda env create -n pygdf --file conda_environments/testing_py35.yml
source "${HOME}"/miniconda3/bin/activate pygdf
python setup.py build
python setup.py install
## python3 pygdf kernel
"${HOME}"/miniconda3/bin/conda install -y -n pygdf ipykernel
ipython kernel install --name pygdf --display-name "python3 PyGDF"  --user

# module5 - keras
mkdir -p "$MODULE5"
virtualenv "$MODULE5/seq2seq"
source "$MODULE5/seq2seq/bin/activate"
pip install keras tensorflow-gpu
wget http://www.manythings.org/anki/fra-eng.zip
unzip -d "$MODULE5" fra-eng.zip fra.txt
git clone https://github.com/fchollet/keras "$MODULE5/keras"
sed -i "s_/Users/fchollet/Downloads/fra-eng/fra.txt_${MODULE5}/fra.txt_" "$MODULE5/keras/examples/lstm_seq2seq.py"

