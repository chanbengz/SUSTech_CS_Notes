#!/bin/bash

set -euxo pipefail

IMAGE_VERSION=v0.0.10

container=$(buildah from docker.io/library/ubuntu:20.04)

buildah run -- "$container" apt update
buildah run -e DEBIAN_FRONTEND=noninteractive -- "$container" \
        apt install -y --no-install-recommends \
        clang clang-format \
        libglib2.0-dev libpixman-1-dev \
        python3 python3-pip \
        git vim less gdb-multiarch curl \
        gcc-riscv64-unknown-elf gawk gcc valgrind build-essential

buildah run -- "$container" pip3 install avocado-framework avocado-framework-plugin-result-html

buildah run -- "$container" rm -rf /var/cache/apt/archives /var/lib/apt/lists

buildah copy "$container" qemu/local /usr/local

buildah config --entrypoint "/usr/bin/bash -l"  "$container"

buildah commit --rm "$container" "glcr.cra.ac.cn/operating-systems/project/kernel_legacy/ucore-tools:${IMAGE_VERSION}"

dev_container=$(buildah from "glcr.cra.ac.cn/operating-systems/project/kernel_legacy/ucore-tools:${IMAGE_VERSION}")

buildah run -- "$dev_container" apt update
buildah run -e DEBIAN_FRONTEND=noninteractive -- "$dev_container" \
        apt install -y --no-install-recommends \
        clang-tidy clangd clang-tools \
        neovim bear tmux openssh-client openssh-server openssh-sftp-server \
        gcc-riscv64-unknown-elf gawk zsh

buildah run -- "$dev_container" rm -rf /var/cache/apt/archives /var/lib/apt/lists

buildah config --entrypoint "/usr/bin/zsh -l"  "$dev_container"

buildah commit --rm "$dev_container" "glcr.cra.ac.cn/operating-systems/project/kernel_legacy/ucore-dev-tools:${IMAGE_VERSION}"
