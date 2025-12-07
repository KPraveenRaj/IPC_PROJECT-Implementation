#!/usr/bin/env bash
set -e

cd /c3_neural_compression

python3 -m c3_neural_compression.experiments.image \
  --config=c3_neural_compression/configs/kodak.py \
  | tee /c3_project/logs/kodak_run.log
