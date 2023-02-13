#!/bin/bash

install_nightly_tools() {
    # https://askubuntu.com/questions/1409031/how-to-use-a-more-recent-clang-format-or-clang-tidy-version-on-ubuntu-18-04
    # https://apt.llvm.org/
    apt update
    NAME=jammy
    apt install -y software-properties-common
    add-apt-repository -y "deb http://apt.llvm.org/$NAME/ llvm-toolchain-$NAME main"
    apt install -y wget
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
    apt update
    TOOLVER=17
    apt install -y \
        clang-format-$TOOLVER \
        clang-tidy-$TOOLVER

    ln -fns /usr/bin/clang-format-$TOOLVER /usr/bin/clang-format
    ln -fns /usr/bin/clang-tidy-$TOOLVER /usr/bin/clang-tidy
}

install_tools() {
    apt install -y clang-format clang-tidy
}

apt update
apt install -y build-essential
install_nightly_tools
# install_tools
apt install -y gdb lldb

apt install -y python3-pip
pip install -U pip
pip install pre-commit

apt install -y git neovim
