#!/usr/bin/env bash

CC=$1

if [ $CC = gcc ]; then
    add-apt-repository -y ppa:ubuntu-toolchain-r/test
    apt-get update && apt-get install -y gcc-11 g++-11
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 110 \
        --slave /usr/bin/g++ g++ /usr/bin/g++-11 \
        --slave /usr/bin/gcov gcov /usr/bin/gcov-11 \
        --slave /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-11 \
        --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-11
elif [$CC = clang]; then
    apt-get -y install clang clang-12
fi
