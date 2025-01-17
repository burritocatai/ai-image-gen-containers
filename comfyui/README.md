# Comfy ui

Comfyui is a great node based AI image generator.

https://github.com/comfyanonymous/ComfyUI

This docker image includes ComfyUI Node Manager as well. https://github.com/ltdrdata/ComfyUI-Manager

## Building

```shell
export CUDA_VERSION=12.4.0
export COMFY_VERSION=v.0.3.10
docker build --build-arg COMFY_VERSION=$COMFY_VERSION \
        --build-arg CUDA_VERSION=$CUDA_VERSION \
        -t comfyui:$COMFY_VERSION-cuda-$CUDA_VERSION .
```

```powershell
$CUDA_VERSION="12.4.0"
$COMFY_VERSION="v.0.3.10"
docker build --build-arg COMFY_VERSION=$COMFY_VERSION \
        --build-arg CUDA_VERSION=$CUDA_VERSION \
        -t comfyui:$COMFY_VERSION-cuda-$CUDA_VERSION .
```
