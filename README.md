# InsectID – all-in-browser version, built by Netlify

The model runs inside the visitor's browser (onnxruntime-web). No backend, photos are never uploaded.
Netlify converts `model/best.pt` to `model/best.onnx` automatically while building, so you do not export anything yourself.

## Deploy
1. Put this whole folder in a GitHub repository (git init, add, commit, push).
2. Netlify -> Add new site -> Import an existing project -> GitHub -> choose the repo.
3. Build settings are read from netlify.toml (command `bash build.sh`, publish directory `.`). Click Deploy.
4. Open the Deploy log. The first build takes several minutes (it installs PyTorch to do the conversion).
5. When published, open the link. The sidebar should say "Model ready".

Note: drag-and-drop deploy (Netlify Drop) does NOT run the build, so use the GitHub route.

## If the build fails
- Python version error: change or delete PYTHON_VERSION in netlify.toml.
- Anything else: copy the last ~20 lines of the deploy log.
- Fallback: convert on your own PC (`pip install ultralytics onnx` then `yolo export model=best.pt format=onnx imgsz=640 opset=12`), put best.onnx in model/, and set the build command to empty in netlify.toml.

## Local test
`python -m http.server 5500` in this folder (needs model/best.onnx), then open http://localhost:5500

## Notes
- Class names are in model/labels.json (same order as your best.pt). Update it if you retrain.
- The model file is public to anyone who opens the site.
- Not tested end-to-end with a real Netlify build.
