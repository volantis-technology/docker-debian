FROM debian:stretch-slim AS builder

# Install gosu (https://github.com/tianon/gosu)
# Install apt-get- (https://github.com/akr89/apt-get-)
# Add entrypoint script
ARG GOSU_VERSION=1.11
ARG GOSU_ARCH=amd64
ADD https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-${GOSU_ARCH} \
    https://raw.githubusercontent.com/akr89/apt-get-/master/apt-get-install \
    https://raw.githubusercontent.com/akr89/apt-get-/master/apt-get-remove \
    ./entrypoint.sh \
    /usr/local/bin/
RUN mv /usr/local/bin/gosu-${GOSU_ARCH} /usr/local/bin/gosu && \
    chmod a+x /usr/local/bin/gosu && \
    chmod a+x /usr/local/bin/apt-get-install && \
    chmod a+x /usr/local/bin/apt-get-remove && \
    chmod a+x /usr/local/bin/entrypoint.sh


FROM debian:stretch-slim

LABEL maintainer="Akrom Khasani <akrom@volantis.io>"

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

COPY --from=builder /usr/local/bin /usr/local/bin/

# Add repo
# Create default user
# Install curl
ADD ./sources.list /etc/apt/
ENV DEFAULT_USER=user
RUN useradd -mU -d /home/${DEFAULT_USER} ${DEFAULT_USER} && passwd -d ${DEFAULT_USER} && \
    apt-get-install curl

# Set working directory
VOLUME /tmp
WORKDIR /tmp

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

# vim:set ft=dockerfile sw=4 ts=4:
