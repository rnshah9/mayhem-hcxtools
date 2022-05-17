FROM --platform=linux/amd64 ubuntu:20.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev openssl zlib1g-dev make gcc

ADD . /hcxtools
WORKDIR /hcxtools
RUN make -j8
