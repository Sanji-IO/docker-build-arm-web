FROM armhfbuild/debian:wheezy
MAINTAINER Zack Yang <zackcf.yang@moxa.com>

RUN apt-get update && apt-get install -y \
    build-essential \
    debhelper \
    libssl-dev \
    libpng-dev \
    python-software-properties \
    git \
    curl && \
    rm -rf /var/lib/apt/lists/* # 20150323

USER root
ENV HOME /root
ENV NODE_INSTALL_VERSION v0.12.7

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash && \
    nvm install $NODE_INSTALL_VERSION && \
    nvm use NODE_INSTALL_VERSION && \
    nvm alias default $NODE_INSTALL_VERSION

WORKDIR $HOME
CMD ["bash"]
