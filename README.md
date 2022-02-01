[![Docker Image CI](https://github.com/AndriyKalashnykov/gatsby-demo/actions/workflows/docker-image.yml/badge.svg?branch=main)](https://github.com/AndriyKalashnykov/gatsby-demo/actions/workflows/docker-image.yml)
# Gatsby demo project

## Pre-requisites

- [Docker](https://docs.docker.com/engine/install/)

## Build unprivileged Nginx docker image

```bash
DOCKER_LOGIN=andriykalashnykov
DOCKER_BUILDKIT=1 docker build -t $DOCKER_LOGIN/gatsby-nginx:latest .
```

## Run docker container

```bash
docker run --rm -it -p 8080:8080 $DOCKER_LOGIN/gatsby-nginx:latest

```
## Open app in browser

```bash
xdg-open http://localhost:8080/
```