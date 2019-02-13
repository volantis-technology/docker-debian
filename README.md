[![](https://img.shields.io/badge/Docker%20Hub-%E2%86%92-blue.svg?style=flat-square&logo=docker&logoColor=white)](https://hub.docker.com/r/volantis/debian)

# Docker Debian

[![](https://img.shields.io/badge/Debian-9%20(stretch)-red.svg?style=flat-square&logo=debian&logoColor=white)](https://www.debian.org)

## Introduction

This repo contains necesary files to build docker image for Debian Linux.

Things that will be installed:

- everything in [debian:stretch-slim](https://hub.docker.com/_/debian/)
- [apt-get-{install|remove}](https://github.com/akr89/apt-get-)
- [gosu](https://github.com/tianon/gosu)
- [curl](https://packages.debian.org/stretch/curl)

## How to build

- clone this repo

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

[![](https://img.shields.io/badge/Made%20with%20&hearts;-@VolantisIO-orange.svg?style=flat-square)](https://volantis.io)
