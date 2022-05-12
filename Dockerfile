# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim less man wget tar git gzip unzip make cmake software-properties-common curl
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev openssl zlib1g-dev

ADD . /hcxtools
WORKDIR /hcxtools
RUN make -j8
