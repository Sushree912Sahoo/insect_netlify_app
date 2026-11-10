#!/usr/bin/env bash
# Runs on Netlify at deploy time: converts model/best.pt -> model/best.onnx
set -euo pipefail
export YOLO_CONFIG_DIR=/tmp/Ultralytics
python -m pip install --upgrade pip
python -m pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu
python -m pip install ultralytics onnx
yolo export model=model/best.pt format=onnx imgsz=640 opset=12
test -f model/best.onnx && ls -la model/
