#!/bin/bash
set -e  # Exit the script if any statement returns a non-true return value

cd /comfyui/ComfyUI && \
source venv/bin/activate

echo "checking missing nodes requirements"

for dir in /comfyui/ComfyUI/custom_nodes/*/; do
    if [ -f "$dir/requirements.txt" ]; then
        echo "Installing requirements in $dir"
        pip3 install -r "$dir/requirements.txt"
    fi
done

echo "Starting comfyui"

	python3 main.py \
    		--listen 0.0.0.0 \
    		--port ${COMFY_UI_PORT:-8082}
sleep infinity