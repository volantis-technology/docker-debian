[![](https://img.shields.io/badge/GitHub-%E2%86%92-brightgreen.svg)](https://github.com/volantis-technology/docker-debian) [![](https://img.shields.io/badge/Docker%20Hub-%E2%86%92-blue.svg)](https://hub.docker.com/r/volantis/debian)

# docker-debian

## Introduction

This repo contains necesary files to build docker image for Debian Linux.

Things that will be installed:

- everything in [debian:stretch-slim](https://hub.docker.com/_/debian/)
- [apt-get-{install|remove}](https://github.com/akr89/apt-get-)
- [gosu](https://github.com/tianon/gosu)
- [curl](https://packages.debian.org/stretch/curl)

## How to build

- clone this repo
```bash
git clone https://github.com/volantis-technology/docker-debian.git && cd docker-debian
```

- build the image
```bash
docker build . -t debian
```

- check by running the image
```bash
docker run -it --rm debian
```

## Maintainer

Akrom Khasani | `akrom (at) volantis (dot) io`

[![](https://img.shields.io/badge/Made%20with%20&#9829;-@VolantisIO-ff69b4.svg)](https://volantis.io)
