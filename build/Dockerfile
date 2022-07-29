FROM ubuntu:20.04 AS deps

ARG BOOST_VERSION=1.75.0
ARG CMAKE_VERSION=3.16.3

RUN apt-get update && apt-get install -y build-essential curl

COPY build_boost.sh .
RUN ./build_boost.sh ${BOOST_VERSION}
ENV BOOST_ROOT=/boost

COPY install_cmake.sh .
RUN ./install_cmake.sh ${CMAKE_VERSION}

FROM ubuntu:20.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive

COPY --from=deps /boost /boost
COPY --from=deps /*.log /
ENV BOOST_ROOT=/boost

COPY --from=deps /opt/cmake/ /opt/cmake/
ENV PATH="/opt/cmake/bin:$PATH"

RUN apt-get update && apt-get install -y git make software-properties-common pkg-config libssl-dev zlib1g-dev bison flex autoconf dpkg-sig equivs

COPY install_compilers.sh .
ARG CC=gcc
RUN ./install_compilers.sh "${CC}"

RUN apt-get clean
COPY build_clio.sh /build_clio.sh
RUN chmod +x /build_clio.sh
CMD ["/build_clio.sh"]
