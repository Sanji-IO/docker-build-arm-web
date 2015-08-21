FROM node:0.12.7
MAINTAINER Zack Yang <zackcf.yang@moxa.com>

RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libpng-dev \
    python-software-properties \
    git \
    qemu-user \
    curl && \
    rm -rf /var/lib/apt/lists/*

USER root
ENV HOME /root

WORKDIR $HOME
CMD ["bash"]
