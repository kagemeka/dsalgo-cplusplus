#!/bin/bash

apt update
apt install -y \
    clang-format \
    clang-tidy

apt install -y python3-pip
pip install -U pip
pip install pre-commit

dump_tidy_config() {
    clang-tidy \
        --dump-config \
        --format-style=llvm \
        -checks=modernize-*
}

install_googletest() {
    # https://github.com/google/googletest/tree/main/googletest
    git clone https://github.com/google/googletest.git -b release-1.11.0
    cd googletest # Main directory of the cloned repository.
    mkdir build   # Create a directory to hold the build output.
    cd build
    cmake .. # Generate native build scripts for GoogleTest.
    make
    make install
    cd ../../
    rm -r ./googletest
}

# apt install -y \
#     clangd \
#     cmake \
#     sudo
# install_googletest
