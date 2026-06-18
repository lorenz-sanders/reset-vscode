FROM debian:sid

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get -y autopurge

RUN apt-get -y install curl git gnupg less man parallel patch ssh vim wget xz-utils

ARG USERNAME
RUN useradd "${USERNAME}" -ms '/bin/bash'

ARG COMPOSE_PROJECT_NAME
COPY --chmod=644 --chown="${USERNAME}:${USERNAME}" '.vimrc' "/home/${USERNAME}"
COPY --chmod=755 'dotfiles_hook' '/usr/local/bin'
RUN install -d -o "${USERNAME}" -g "${USERNAME}" "/home/${USERNAME}/dotfiles" && \
    install -d -o "${USERNAME}" -g "${USERNAME}" "/workspaces/${COMPOSE_PROJECT_NAME}" && \
    sed -i '/PS1.*\\\$/s/\\\$/\\n\0/' "/home/${USERNAME}/.bashrc"
