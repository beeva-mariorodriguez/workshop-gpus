# infrastructure


## setup
```
docker pull beevamariorodriguez/nvidia_caffe_server
wget http://i.eurosport.com/2016/07/31/1902600-40047810-640-360.jpg
wget http://elinversorsobrio.com/wp-content/uploads/2017/03/cropped-botijo-solo.png
```

## nvidia gpu rest engine
* [nvidia/gpu-rest-engine](https://github.com/NVIDIA/gpu-rest-engine)
* [Dockerfile](https://github.com/NVIDIA/gpu-rest-engine/blob/master/Dockerfile.caffe_server)

### (just) docker
```bash
docker run -d --name caffeserver -p 127.0.0.1:8000:8000 --rm -ti beevamariorodriguez/nvidia_caffe_server
```
will not run, no access to nvidia drivers, device files ...

### nvidia-docker
```bash
nvidia-docker run -d --name caffeserver -p 127.0.0.1:8000:8000 --rm -ti beevamariorodriguez/nvidia_caffe_server
```
```bash
curl -XPOST --data-binary @cropped-botijo-solo.png http://127.0.0.1:8000/api/classify| jq .
curl -XPOST --data-binary @1902600-40047810-640-360.jpg http://127.0.0.1:8000/api/classify| jq .
```
```bash
docker stop caffeserver
```

### mesos
```bash
cat /etc/marathon/conf/enable_features
cat /etc/mesos-slave/isolation
cat /etc/mesos-slave/image_providers
```

```bash
cd workshop-gpus/infrastructure
curl -XPUT -H 'Content-Type: application/json' -i http://127.0.0.1:8080/v2/apps/caffe -d@caffe.application.json

```
```bash
curl -XPOST --data-binary @cropped-botijo-solo.png http://127.0.0.1:8000/api/classify| jq .
curl -XPOST --data-binary @1902600-40047810-640-360.jpg http://127.0.0.1:8000/api/classify| jq .
```

```json
{
  "id": "caffe",
  "cmd": "/go/bin/caffe-server /caffe/models/bvlc_reference_caffenet/deploy.prototxt /caffe/models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel /caffe/data/ilsvrc12/imagenet_mean.binaryproto /caffe/data/ilsvrc12/synset_words.txt",
  "cpus": 4,
  "mem": 1024,
  "disk": 512,
  "gpus":1,
  "instances": 1,
  "container": {
    "docker": {
      "image": "beevamariorodriguez/nvidia_caffe_server:latest"
    },
    "type": "MESOS",
    "volumes": []
  },
  "env": {
    "LD_LIBRARY_PATH": "/usr/local/nvidia/lib64"
  },
  "volumes": [
      {
        "containerPath": "/usr/local/nvidia",
        "hostPath": "/usr/local/nvidia",
        "mode": "RO"
      }
    ],
  "portDefinitions": [
    {
      "port": 0,
      "protocol": "tcp",
      "name": null,
      "labels": null
    }
  ],
  "labels": {},
  "healthChecks": []
}
```
```bash
curl -XDELETE http://127.0.0.1:8080/v2/apps/caffe
```

