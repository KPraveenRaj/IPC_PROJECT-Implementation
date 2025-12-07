#!/usr/bin/env bash
set -e

cd /c3_neural_compression

echo "Make sure you already ran download_uvg.sh with:"
echo '  export ROOT="Your Path"'
echo "and that configs/uvg.py has:"
echo '  exp.dataset.root_dir = "Your Path"'
echo

python3 -m c3_neural_compression.experiments.video \
  --config=c3_neural_compression/configs/uvg.py \
  | tee /c3_project/logs/uvg_run.log
