#!/usr/bin/env bash

CMAKE_VERSION=$1
URL="https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz"
curl -OJLs $URL
tar xzf cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz
mv /cmake-${CMAKE_VERSION}-Linux-x86_64/ /opt/cmake/
