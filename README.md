# AI Image Generation Containers

This repository contains various containerized applications designed for AI-based image generation. These containers are optimized for use with NVIDIA GPUs, enabling efficient and high-performance image generation workflows.

## Docker Compose Instructions

To run the AI image generation containers with shared model storage, the `docker-compose.yml` file can be used. The setup allows both containers to share the same models mount point for efficient disk space usage.Use the command `docker-compose up` to start the services.