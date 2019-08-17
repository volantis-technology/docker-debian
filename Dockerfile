# syntax = docker/dockerfile:1.1-experimental

FROM debian:stretch-slim AS builder

# Install gosu (https://github.com/tianon/gosu)
# Add entrypoint script
ARG GOSU_VERSION=1.11
ARG GOSU_ARCH=amd64
ADD https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-${GOSU_ARCH} \
    ./entrypoint.sh \
    /opt/
RUN mv /opt/gosu-${GOSU_ARCH} /opt/gosu && \
    chmod a+x /opt/gosu && \
    chmod a+x /opt/entrypoint.sh


FROM debian:stretch-slim

LABEL maintainer="Akrom Khasani <akrom@volantis.io>"

COPY --from=builder /opt /usr/local/bin/

# Add repo
# Install curl
# Create default user
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 DEFAULT_USER=user
ADD ./sources.list /etc/apt/
RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt --mount=type=cache,target=/var/lib/apt/lists \
    apt-get -q update && apt-get install -y --no-install-recommends curl && \
    useradd -mU -d /home/${DEFAULT_USER} ${DEFAULT_USER} && passwd -d ${DEFAULT_USER}

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

# vim:set ft=dockerfile sw=4 ts=4:
