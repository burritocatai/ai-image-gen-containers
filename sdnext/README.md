# SD.Next

SD.Next is a Stable Diffusion AI Image Generator.

## Pulling

docker pull ghcr.io/burritocatai/sdnext:cuda-12.4.0

## Notes

There is now an official SD.Next docker image that might work for you: https://vladmandic.github.io/sdnext-docs/Docker/

## Building

```shell
export CUDA_VERSION=12.4.0
docker build --build-arg --build-arg CUDA_VERSION=$CUDA_VERSION -t sdnext:cuda-$CUDA_VERSION .
```

```powershell
$CUDA_VERSION="12.4.0"
docker build --build-arg CUDA_VERSION=$CUDA_VERSION -t sdnext:cuda-$CUDA_VERSION .
```
