# Keras example for machine translation
Following example https://blog.keras.io/a-ten-minute-introduction-to-sequence-to-sequence-learning-in-keras.html

### Launch virtualenv
```
cd module5
source seq2seq/bin/activate
pip install h5py theano
```

### Launch script
```
cd keras
python examples/lstm_seq2seq.py
# Training 100 epochs should take 25 min !!

# Compare with CPU-only
CUDA_VISIBLE_DEVICES="" python examples/lstm_seq2seq.py
# To change de backend edit ~/.keras/keras.json
```

### GPU and CUDA profiling
```
/usr/local/cuda-8.0/bin/nvprof -f -o seq2seq.nvprof -t 2 python examples/lstm_seq2seq.py
# And import with nvvp
# For GPU utilization see nvidia-smi or nvidia-settings -q GPUUtilization
```

### Tuning
Tune batch size and learning rate in lstm_seq2seq.py
```
from keras import optimizers
#...
batch_size = 256
#...
rmsprop = optimizers.rmsprop(lr=0.004)
model.compile(optimizer=rmsprop, loss='categorical_crossentropy')
#...
```
