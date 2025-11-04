#!/bin/bash
set -e

echo " Building R stage image..."
docker build -t r_stage ./r_stage

echo " Building Python stage image..."
docker build -t py_stage ./py_stage

mkdir -p data/stage1_out data/final_out

echo " Running R stage..."
docker run --rm -v "$PWD/data:/data" r_stage

echo " Running Python stage..."
docker run --rm -v "$PWD/data:/data" py_stage

echo " Pipeline complete! Check data/final_out for results."
