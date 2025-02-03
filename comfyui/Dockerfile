ARG CUDA_VERSION=12.4.0
ARG COMFYUI_VERSION=v0.3.13

FROM nvidia/cuda:${CUDA_VERSION}-runtime-ubuntu22.04
ARG COMFYUI_VERSION

LABEL org.opencontainers.image.authors="danwiseman"
LABEL org.opencontainers.image.base.name="https://hub.docker.com/nvidia/cuda:${CUDA_VERSION}-runtime-ubuntu22.04"
LABEL org.opencontainers.image.source="https://github.com/burritocatai/ai-image-gen-containers"

ENV TRANSFORMERS_CACHE=/comfyui/cache

WORKDIR /

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt update && \
    apt -y upgrade && \
    apt install -y --no-install-recommends \
    git python3 python3.10-venv python3-dev \
    build-essential libssl-dev libffi-dev \
    libxml2-dev libxslt1-dev zlib1g-dev libgl1 \
    libgl1-mesa-glx \
    libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/* && \
    useradd comfyui && \
    mkdir comfyui && \
    mkdir comfyui/cache


COPY ./start.sh /comfyui/start.sh

RUN chown -R comfyui:comfyui /comfyui && \
    chmod +x /comfyui/start.sh

USER comfyui

WORKDIR /comfyui

RUN git clone --branch ${COMFYUI_VERSION} https://github.com/comfyanonymous/ComfyUI

RUN cd ./ComfyUI && \
    python3 -m venv venv && \
    source venv/bin/activate && \
    pip3 install wheel && \
    pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121 && \
    pip3 install -r requirements.txt && \
    pip3 install insightface onnxruntime onnxruntime-gpu huggingface_hub[cli]

RUN cd /comfyui/ComfyUI/custom_nodes && \
    git clone https://github.com/ltdrdata/ComfyUI-Manager.git

ENTRYPOINT ["/bin/bash", "/comfyui/start.sh"]