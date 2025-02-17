#FROM chat2db/chat2db:latest
#FROM mongo
#FROM getmeili/meilisearch:v1.7.3
#FROM ankane/pgvector:latest
#FROM jhj0517/whisper-webui:latest
# This vLLM Dockerfile is used to construct image that can build and run vLLM on x86 CPU platform.
FROM ubuntu:22.04 AS cpu-test-1
ENV CCACHE_DIR=/root/.cache/ccache
ENV CMAKE_CXX_COMPILER_LAUNCHER=ccache
RUN --mount=type=cache,target=/var/cache/apt \
    apt-get update -y \
    && apt-get install -y curl ccache git wget vim numactl gcc-12 g++-12 python3 python3-pip libtcmalloc-minimal4 libnuma-dev \
    && apt-get install -y ffmpeg libsm6 libxext6 libgl1 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 10 --slave /usr/bin/g++ g++ /usr/bin/g++-12
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install intel-openmp==2025.0.1
ENV LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libtcmalloc_minimal.so.4:/usr/local/lib/libiomp5.so"
RUN echo 'ulimit -c 0' >> ~/.bashrc
RUN pip install intel_extension_for_pytorch==2.5.0
