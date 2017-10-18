# Keras example for machine translation
Following example https://blog.keras.io/a-ten-minute-introduction-to-sequence-to-sequence-learning-in-keras.html

### Launch virtualenv
```
cd module5
source seq2seq/bin/activate
```

### Launch script
```
python examples/lstm_seq2seq.py
# Compare with CPU-only
CUDA_VISIBLE_DEVICES="" python examples/lstm_seq2seq.py
```

### GPU and CUDA profiling
```
/usr/local/cuda-8.0/bin/nvprof -f -o seq2seq.nvprof -t 2 python examples/lstm_seq2seq.py
# And import with nvvp
# For GPU utilization see nvidia-smi or nvidia-settings -q GPUUtilization
```

