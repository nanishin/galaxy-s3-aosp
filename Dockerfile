# Docker Image to build Galaxy S3 AOSP
FROM ubuntu:16.04

MAINTAINER Nani Shin <nani.shin@gmail.com>

RUN sed -i 's/main$/main universe/' /etc/apt/sources.list

RUN dpkg --add-architecture i386

RUN apt-get update && apt-get -y install software-properties-common

RUN add-apt-repository ppa:openjdk-r/ppa #&& apt-get -y install openjdk-7-jdk

RUN apt-get -y install curl git mc rsync screen tig \
    git-core gnupg flex bison gperf build-essential \
    zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
    lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
    libgl1-mesa-dev libxml2-utils schedtool xsltproc unzip \
    python-networkx \
    vim-tiny \
    lzop

RUN curl http://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo

RUN chmod a+x /usr/local/bin/repo

RUN id jenkins 2>/dev/null || useradd --uid 1000 --create-home --shell /bin/bash jenkins

RUN id build 2>/dev/null || useradd --uid 30000 --create-home --shell /bin/bash build

RUN echo "build ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers

#USER build

WORKDIR /home/build

CMD "/bin/bash"
