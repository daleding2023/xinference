#FROM infiniflow/ragflow:v0.12.0
#FROM infiniflow/ragflow:v0.12.0-slim
#FROM infiniflow/ragflow:dev
#FROM infiniflow/ragflow:dev-slim
#FROM infiniflow/ragflow:v0.15.0
#FROM infiniflow/ragflow:v0.15.1-slim
#FROM infiniflow/ragflow:v0.16.0-slim
#FROM  infiniflow/ragflow:v0.19.1-slim
#FROM  infiniflow/ragflow:v0.20.1-slim
#FROM  infiniflow/ragflow:v0.22.0-slim
#FROM infiniflow/ragflow:nightly
#FROM infiniflow/ragflow:v0.25.0
#FROM infiniflow/sandbox-executor-manager:latest
#FROM infiniflow/sandbox-base-nodejs:latest
#FROM infiniflow/sandbox-base-python:latest
#FROM elasticsearch:8.11.3
#FROM infiniflow/text-embeddings-inference:cpu-1.8
#FROM infiniflow/text-embeddings-inference:1.8
#FROM edwardelric233/ragflow:oc9
#FROM infiniflow/ragflow:nightly
#20260602
#FROM deepdoc_oss:latest
FROM ubuntu:24.04

ARG NEED_MIRROR=1

ENV PYTHONPATH=/app
ENV DEBIAN_FRONTEND=noninteractive

# ── System dependencies (onnxruntime + opencv runtime libs) ──
RUN apt-get update && apt-get install -y --no-install-recommends \
    -o Acquire::Retries=5 \
    python3.12 python3.12-venv \
    libglib2.0-0 libglx-mesa0 libgl1 libgomp1 \
    libgdiplus curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*
