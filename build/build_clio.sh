#!/usr/bin/env bash

export SRC_DIR=$(realpath clio_src)
echo "Clio SRC_DIR passed to CMake: ${SRC_DIR}"

cmake -S clio_ci -B clio_ci/build -DSRC_DIR=$SRC_DIR
cmake --build clio_ci/build --parallel $(nproc)
