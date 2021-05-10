FROM ubuntu:groovy
SHELL ["/bin/bash", "-c"]

ENV RUST_VERSION=1.50.0

ENV DEBIAN_FRONTEND noninteractive

COPY .bashrc /root/

RUN apt-get update &&\
    apt-get install -y llvm-10 lldb-10 llvm-10-dev libllvm10 llvm-10-runtime curl &&\
    curl https://sh.rustup.rs -sSf | sh -s -- -y &&\
    source $HOME/.cargo/env &&\
    rustup default $RUST_VERSION
