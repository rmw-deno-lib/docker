FROM ubuntu:groovy
SHELL ["/bin/bash", "-c"]
USER root

ENV RUST_VERSION=1.50.0

ENV DEBIAN_FRONTEND noninteractive

COPY .bashrc /root/

RUN \
apt-get update &&\
apt-get install -y \
curl nodejs yarn apt-utils libcurl3-gnutls \
libllvm10 &&\
curl https://sh.rustup.rs -sSf | sh -s -- -y &&\
source $HOME/.cargo/env &&\
rustup default $RUST_VERSION &&\
curl -k -sSf https://rustwasm.github.io/wasm-pack/installer/init.sh | sh &&\
yarn global add rustwasmc &&\
apt-get autoclean -y &&\
rm -rf /var/lib/apt/lists/

CMD ['/pkg/dist.sh']
