LABEL "Ubuntu 16.04 with Docker CE"
MAINTAINER "Thom Wiggers <thom@thomwiggers.nl>"
FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
    add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable" \
    apt-get update && \
    apt-get install docker-ce && \
    apt-get purge -y \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common && \
    rm -rf /var/cache/apt/
