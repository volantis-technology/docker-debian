FROM debian:stretch-slim

LABEL maintainer="Akrom Khasani <akrom@volantis.io>"

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# Create default user
# Install gosu (https://github.com/tianon/gosu)
# Install apt-get- (https://github.com/akr89/apt-get-)
# Add entrypoint script
ENV DEFAULT_USER=user
ARG GOSU_VERSION=1.11
ARG GOSU_ARCH=amd64
ADD https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-${GOSU_ARCH} \
    https://raw.githubusercontent.com/akr89/apt-get-/master/apt-get-install \
    https://raw.githubusercontent.com/akr89/apt-get-/master/apt-get-remove \
    ./entrypoint.sh \
    /usr/local/bin/
RUN useradd -mU -d /home/${DEFAULT_USER} ${DEFAULT_USER} && passwd -d ${DEFAULT_USER} && \
    chmod a+x /usr/local/bin/gosu-${GOSU_ARCH} && \
    ln -sf /usr/local/bin/gosu-${GOSU_ARCH} /usr/local/bin/gosu && \
    chmod a+x /usr/local/bin/apt-get-install && \
    chmod a+x /usr/local/bin/apt-get-remove && \
    chmod a+x /usr/local/bin/entrypoint.sh

# Add repo
# Install curl
ADD ./sources.list /etc/apt/
RUN apt-get-install curl

# Set working directory
VOLUME /tmp
WORKDIR /tmp

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

# vim:set ft=dockerfile sw=4 ts=4:
