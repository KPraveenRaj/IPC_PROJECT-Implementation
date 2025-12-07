# C3 Neural Compression – Project Implementation

This repository documents my implementation and experimentation with  
Google DeepMind's **C3 Neural Compression** model, including:

## ✔ Features Included
- Docker environment setup for CUDA 12 + JAX GPU + TensorFlow GPU
- Running image compression experiments (Kodak dataset)
- Extracted metrics (PSNR, SSIM, loss, bpp, etc.)
- Plans for video compression using the UVG dataset
- Mounting external HDD for dataset storage

## ✔ How to Run (Docker)

```bash
docker build -t c3-gpu .
docker run --gpus all -v /path/to/hdd:/mnt/hdd -it c3-gpu bash
