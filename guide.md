
# Conectar a la máquina

1. Descárgate la clave `workshop2017.pem`
1. Abre una consola
1. Dale permisos de solo lectura para tu usuario a la clave.

	`chmod 400 Descargas/workshop2017.pem`

1. Conéctate a la máquina.

	`ssh -L 8888:127.0.0.1:8888 -L 9092:127.0.0.1:9092 ubuntu@13.58.115.202 -i Descargas/workshop2017.pem`


# Módulo 1

## 01  RGB2Gray
1. Ejecutar el programa y analizar.
```bash
cd ~/workshop-gpus/minpy-exercise
python rgb2gray.py
```
Profiling:
```
nvprof python rgb2gray.py
```
1. Editar `rgb2gray.py` y modificar el parámetro `n=200` (número de transformaciones a ejecutar).

¿En qué caso merece la pena usar GPU?



# Módulo 2

## 01 CUDA
```
cd ~/workshop-gpus/Cuda_exercises
```
# Módulo 2

## 01

# Módulo 2

## 01
# Módulo 2

## 01
