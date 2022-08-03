#!/usr/bin/env bash

export CLIO_ROOT=$(realpath clio_src)
echo "[${CLIO_ROOT}] passed to Clio repo as CLIO_ROOT"

cmake -S clio_ci -B clio_ci/build -DCLIO_ROOT=$CLIO_ROOT
cmake --build clio_ci/build --parallel $(nproc) | tee -a clio_build.log
cp /*.log . # get the boost build logs
cp ./clio_ci/build/clio-prefix/src/clio-build/clio_tests .
mv ./clio_ci/build/*.deb .
