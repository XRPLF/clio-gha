#!/usr/bin/env bash

cmake -S clio_src -B clio_src/build 
cmake --build clio_src/build --parallel $(nproc)