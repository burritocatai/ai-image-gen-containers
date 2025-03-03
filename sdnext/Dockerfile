ARG CUDA_VERSION=12.4.0

FROM nvidia/cuda:${CUDA_VERSION}-runtime-ubuntu22.04

# Set author label
LABEL org.opencontainers.image.authors="danwiseman"
LABEL org.opencontainers.image.base.name="https://hub.docker.com/nvidia/cuda:${CUDA_VERSION}-runtime-ubuntu22.04"
LABEL org.opencontainers.image.source="https://github.com/burritocatai/ai-image-gen-containers"


# Default working directory
WORKDIR /

# Replace the default shell with bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Update and upgrade system packages, install required tools and dependencies
RUN apt update && \
    apt -y upgrade && \
    apt install -y --no-install-recommends \
    git python3 python3.10-venv && \
    useradd sdnext && \
    mkdir /sdnext

# Copy the start script to the container and set ownership/permissions
COPY ./start.sh /sdnext/start.sh
RUN chown -R sdnext:sdnext /sdnext && \
    chmod +x /sdnext/start.sh

# Switch to the newly created user
USER sdnext

# Set working directory for the user
WORKDIR /sdnext

# Clone the repository and set up the Python environment
RUN git clone https://github.com/vladmandic/automatic && \
    cd ./automatic && \
    python3 -m venv venv && \
    source venv/bin/activate && \
    pip3 install wheel && \
    pip3 install torch torchvision


EXPOSE 7860/tcp

# Entrypoint command to run the start script
ENTRYPOINT ["/bin/bash", "/sdnext/start.sh"]