FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    ca-certificates \
    file \
    git \
    gcc \
    g++ \
    make \
    libc6-dev \
    pkg-config \
    autoconf \
    automake \
    libtool \
    texinfo \
    wget \
    xz-utils \
    libusb-1.0-0-dev \
    libftdi1-dev \
    libhidapi-dev \
    libgpiod-dev \
    libcapstone-dev \
    libjaylink-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

COPY . /workspace/openocd

# Shared OpenOCD build environment image.
# The source tree is copied in, but .git is excluded by .dockerignore.
# If configure is missing, run "./bootstrap nosubmodule" inside the container.
CMD ["/bin/bash"]
