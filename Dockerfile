FROM ghcr.io/nnooney-docker/base-user:main

LABEL maintainer="Nicholas Nooney <nicholasnooney@gmail.com>"

RUN apt update && apt install -y -q --no-install-recommends \
  apt-transport-https \
  build-essential \
  ca-certificates \
  curl \
  git \
  golang \
  gpg \
  hugo \
  libssl-dev \
  ssh \
  wget \
  && apt autoremove -y && apt clean -y

# Install NVM to manage node
ENV NVM_DIR /usr/local/nvm
ENV NVM_VERSION v0.39.0
ENV NODE_VERSION 16.11.1

WORKDIR ${NVM_DIR}

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh | bash \
  && . ${NVM_DIR}/nvm.sh \
  && nvm install ${NODE_VERSION} \
  && nvm alias default ${NODE_VERSION} \
  && nvm use default

ENV PATH ${NVM_DIR}/versions/node/v${NODE_VERSION}/bin:${PATH}
