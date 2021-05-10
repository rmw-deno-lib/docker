FROM ubuntu:hirsute
SHELL ["/bin/bash", "-c"]
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y llvm-10 lldb-10 llvm-10-dev libllvm10 llvm-10-runtime rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


