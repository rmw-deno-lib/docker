FROM ubuntu:groovy
SHELL ["/bin/bash", "-c"]
USER root

ENV RUST_VERSION=1.50.0

ENV DEBIAN_FRONTEND noninteractive

COPY .bashrc /root/

RUN \
apt-get update &&\
apt-get install -y --no-install-recommends \
curl nodejs yarn libcurl3-gnutls \
llvm-10 lldb-10 llvm-10-dev libllvm10 llvm-10-runtime &&\
curl https://sh.rustup.rs -sSf | sh -s -- -y &&\
source $HOME/.cargo/env &&\
rustup default $RUST_VERSION &&\
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh &&\
yarn global add rustwasmc &&\
apt-get autoclean -y &&\
rm -rf /var/lib/apt/lists/



CMD ['/pkg/dist.sh']
