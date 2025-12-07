FROM nvidia/cuda:12.2.0-base-ubuntu22.04

# ---- System deps ----
RUN apt-get update && apt-get install -y \
    python3.10 python3.10-venv python3.10-dev \
    git curl \
    p7zip-full \
    ffmpeg \
    wget \
    nano \
    && ln -s /usr/bin/python3.10 /usr/bin/python \
    && curl -sS https://bootstrap.pypa.io/get-pip.py | python \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ---- Python tooling ----
RUN python -m pip install --upgrade pip setuptools wheel

# ---- JAX GPU (CUDA 12) ----
RUN pip install --pre -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html \
    "jax[cuda12]==0.4.24"

# ---- TensorFlow GPU ----
RUN pip install "tensorflow[and-cuda]==2.17.1"

# ---- PyTorch CPU (only for data loading) ----
RUN pip install torch==2.2.0+cpu torchvision==0.17.0+cpu \
    --index-url https://download.pytorch.org/whl/cpu

# ---- Clone official C3 repo ----
RUN git clone https://github.com/google-deepmind/c3_neural_compression.git

WORKDIR /c3_neural_compression

# ---- Patch requirements to avoid conflicting torch pins ----
RUN sed -i 's/^torchFROM nvidia/cuda:12.2.0-base-ubuntu22.04

# ---- System deps ----
RUN apt-get update && apt-get install -y \
    python3.10 python3.10-venv python3.10-dev \
    git curl \
    p7zip-full \
    ffmpeg \
    wget \
    nano \
    && ln -s /usr/bin/python3.10 /usr/bin/python \
    && curl -sS https://bootstrap.pypa.io/get-pip.py | python \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ---- Python tooling ----
RUN python -m pip install --upgrade pip setuptools wheel

# ---- JAX GPU (CUDA 12) ----
RUN pip install --pre -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html \
    "jax[cuda12]==0.4.24"

# ---- TensorFlow GPU ----
RUN pip install "tensorflow[and-cuda]==2.17.1"

# ---- PyTorch CPU (only for data loading) ----
RUN pip install torch==2.2.0+cpu torchvision==0.17.0+cpu \
    --index-url https://download.pytorch.org/whl/cpu

# ---- Clone official C3 repo ----
RUN git clone https://github.com/google-deepmind/c3_neural_compression.git

WORKDIR /c3_neural_compression

# ---- Patch requirements to avoid conflicting torch pins ----
RUN sed -i 's/^torch==/## torch== removed in Docker/' requirements.txt && \
    sed -i 's/^torchvision==/## torchvision== removed in Docker/' requirements.txt

# ---- Install remaining deps ----
RUN pip install -r requirements.txt

# ---- Let Python find the package ----
ENV PYTHONPATH=/c3_neural_compression

# Optional: document UVG dataset default root inside container
ENV UVG_ROOT=/mnt/ExternalHardDrive/uvg-dataset

CMD ["/bin/bash"]

