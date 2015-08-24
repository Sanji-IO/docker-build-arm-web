FROM armhfbuild/debian:wheezy
MAINTAINER Zack Yang <zackcf.yang@moxa.com>

RUN apt-get update && apt-get install -y \
    build-essential \
    debhelper \
    libssl-dev \
    libpng-dev \
    python-software-properties \
    git &&\
    rm -rf /var/lib/apt/lists/* # 20150323

USER root
ENV HOME /root
ENV NODE_INSTALL_VERSION v0.12.7

# Install node.js
RUN git clone https://github.com/creationix/nvm.git $HOME/.nvm
RUN /bin/bash -c "source ~/.nvm/nvm.sh && nvm install $NODE_INSTALL_VERSION && \
   nvm use ${NODE_INSTALL_VERSION} && nvm alias default $NODE_INSTALL_VERSION && \
   ln -s $HOME/.nvm/$NODE_INSTALL_VERSION/bin/node /usr/bin/node && \
   ln -s $HOME/.nvm/$NODE_INSTALL_VERSION/bin/npm /usr/bin/npm"

WORKDIR $HOME
CMD ["bash"]
