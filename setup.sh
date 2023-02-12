#!/bin/bash

apt update
apt install -y \
    build-essential \
    clang-format \
    clang-tidy

apt install -y python3-pip
pip install -U pip
pip install pre-commit
