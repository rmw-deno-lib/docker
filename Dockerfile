FROM ubuntu:groovy
SHELL ["/bin/bash", "-c"]

ENV RUST_VERSION=1.50.0

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update &&\
    apt-get install -y llvm-10 lldb-10 llvm-10-dev libllvm10 llvm-10-runtime curl &&\
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh &&\
    rustup default $RUST_VERSION
