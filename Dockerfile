FROM ubuntu:20.04

ARG USERNAME=docker
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ENV DEBIAN_FRONTEND=noninteractive 

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
     && apt-get update \
     && apt-get install -y sudo \
     && apt-get install -y git make libz-dev gnat llvm clang \
     && git clone https://github.com/ghdl/ghdl.git \
     && cd ghdl \
     && ./configure --with-llvm-config \
     && make \
     && make install \
     && cd .. \
     && rm -rf ghdl \
     && apt-get install -y gtkwave \ 
     && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
     && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME
WORKDIR /home/$USERNAME

