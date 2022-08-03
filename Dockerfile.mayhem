FROM --platform=linux/amd64 ubuntu:20.04 as builder

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev openssl zlib1g-dev make gcc

ADD . /hcxtools
WORKDIR /hcxtools
RUN make -j8

RUN mkdir -p /deps
RUN ldd /hcxtools/hcxeiutool | tr -s '[:blank:]' '\n' | grep '^/' | xargs -I % sh -c 'cp % /deps;'

FROM ubuntu:20.04 as package

COPY --from=builder /deps /deps
COPY --from=builder /hcxtools/hcxeiutool /hcxtools/hcxeiutool
ENV LD_LIBRARY_PATH=/deps
