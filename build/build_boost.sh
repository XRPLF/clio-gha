#!/usr/bin/env bash
set -exu

BOOST_VERSION=$1
BOOST_VERSION_=$(echo ${BOOST_VERSION} | tr . _)
echo "BOOST_VERSION: ${BOOST_VERSION}"
curl -OJLs "https://boostorg.jfrog.io/artifactory/main/release/${BOOST_VERSION}/source/boost_${BOOST_VERSION_}.tar.gz"
tar zxf "boost_${BOOST_VERSION_}.tar.gz"
cd boost_${BOOST_VERSION_} && ./bootstrap.sh | tee -a /boost_build.log && ./b2 -j$(nproc) | tee -a /boost_build.log 2>&1
mkdir -p /boost && mv boost /boost && mv stage /boost
