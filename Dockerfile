FROM ubuntu:14.04

ENV TORNAMR_PATH     /mnt/tornamr
ENV DEBIAN_FRONTEND  noninteractive
ENV PYTHONUNBUFFERED true

MAINTAINER th0ughtcr1me@protonmail.ch

# install system dependencies
RUN apt-get update \
  && apt-get --yes install \
    bash \
    build-essential \
    ca-certificates \
    coreutils \
    curl \
    wget \
    git \
    virtualenvwrapper \
    python-dev \
    bash-completion \
    gnupg \
    libev-dev \
    libffi-dev \
    libssl-dev \
    vim \
    wget \
  && rm -rf /var/lib/apt/lists/*

RUN rm -f /bin/sh && ln -s /bin/bash /bin/sh

RUN mkdir -p $TORNAMR_PATH
COPY eschalot-1.2.0.tar.gz $TORNAMR_PATH
WORKDIR $TORNAMR_PATH

RUN apt-get update \
  && apt-get --yes install \
    wamerican \
    wbrazilian \
    wdutch \
    wngerman \
    wnorwegian \
    wnorwegian \
    wspanish \
    wswedish \
    wukrainian \
  && rm -rf /var/lib/apt/lists/*

RUN tar xzvf eschalot-1.2.0.tar.gz && rm -rf $TORNAMR_PATH/.git
RUN cd eschalot-1.2.0 && make && make install && cp -fv *.txt $TORNAMR_PATH && rm -rf $TORNAMR_PATH/eschalot-1.2.0
RUN rm -rf $TORNAMR_PATH/*.gz
WORKDIR $TORNAMR_PATH
