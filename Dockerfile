FROM armhfbuild/debian:wheezy
MAINTAINER Zack Yang <zackcf.yang@moxa.com>

RUN apt-get update && apt-get install -y \
    build-essential \
    debhelper \
    libssl-dev \
    libpng-dev \
    python-software-properties \
    curl \
    git &&\
    rm -rf /var/lib/apt/lists/* # 20150323

USER root
ENV HOME /root

# Install node.js
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs

WORKDIR $HOME
CMD ["bash"]
