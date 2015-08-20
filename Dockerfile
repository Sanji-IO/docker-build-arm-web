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

# Setup ssh key and git config
RUN /bin/bash -c "mkdir .ssh && \
                  echo 'ssh-keygen -q -f ~/.ssh/id_rsa -N \"\" -t rsa' >> ~/.bash_profile && \
                  echo 'cat ~/.ssh/id_rsa.pub' >> ~/.bash_profile && \
                  echo 'echo -e \"Host github.com\n\tStrictHostKeyChecking no\n\" >> ~/.ssh/config' >> ~/.bash_profile && \
                  echo 'echo -e \"Host bitbucket.org\n\tStrictHostKeyChecking no\n\" >> ~/.ssh/config' >> ~/.bash_profile && \
                  echo 'git config --global url.\"https://\".insteadOf git://' >> ~/.bash_profile"

ENTRYPOINT ["/bin/bash", "--login", "-i", "-c"]
WORKDIR $HOME
CMD ["bash"]
