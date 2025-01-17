# Comfy ui

Comfyui is a great node based AI image generator.

https://github.com/comfyanonymous/ComfyUI

This docker image includes ComfyUI Node Manager as well. https://github.com/ltdrdata/ComfyUI-Manager



## Building

```shell
export CUDA_VERSION=12.4.0
docker build --build-arg --build-arg CUDA_VERSION=$CUDA_VERSION -t sdnext:cuda-$CUDA_VERSION .
```

```powershell
$CUDA_VERSION="12.4.0"
docker build --build-arg CUDA_VERSION=$CUDA_VERSION -t sdnext:cuda-$CUDA_VERSION .
```
