FROM debian:stretch-slim

LABEL maintainer="Akrom Khasani <akrom@volantis.io>"

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# Create users
ENV DEFAULT_USER=user
RUN useradd -mU -d /home/${DEFAULT_USER} ${DEFAULT_USER} && passwd -d ${DEFAULT_USER}

# Install gosu
# (https://github.com/tianon/gosu)
ARG GOSU_VERSION=1.11
ARG GOSU_ARCH=amd64
ADD https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-${GOSU_ARCH} /usr/local/bin/
RUN chmod a+x /usr/local/bin/gosu-${GOSU_ARCH} && \
    ln -sf /usr/local/bin/gosu-${GOSU_ARCH} /usr/local/bin/gosu

# Install apt-get-
# (https://github.com/akr89/apt-get-)
ADD https://raw.githubusercontent.com/akr89/apt-get-/master/apt-get-install \
    https://raw.githubusercontent.com/akr89/apt-get-/master/apt-get-remove \
    /usr/local/bin/
RUN chmod a+x /usr/local/bin/apt-get-install && \
    chmod a+x /usr/local/bin/apt-get-remove

# Install curl
RUN apt-get-install curl

# Add entrypoint
ADD ./entrypoint.sh /usr/local/
RUN chmod a+x /usr/local/entrypoint.sh

# Set working directory
VOLUME /tmp
WORKDIR /tmp

ENTRYPOINT [ "/usr/local/entrypoint.sh" ]

# vim:set ft=dockerfile sw=4 ts=4:
