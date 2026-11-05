# For testing these dotfiles on an ubuntu docker image
#
# To execute bash on this image, from this dir run:
#
# docker rmi -f dotfiles; docker build -t dotfiles . && docker run --rm -it --name dotfiles dotfiles bash
#
# Then to test new changes run the following in the container bash shell:
#
# su default
# make install (or otherwise)
#

FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    python3-setuptools \
    gawk \
    nano \
    curl \
    bash \
    git \
    sudo

RUN useradd --shell /bin/bash --create-home default && \
    echo "default ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/default

COPY . /dotfiles
RUN chmod -R o+rwx /dotfiles
WORKDIR /dotfiles

CMD [ "bash" ]
