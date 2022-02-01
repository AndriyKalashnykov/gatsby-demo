[![Docker Image CI](https://github.com/AndriyKalashnykov/gatsby-demo/actions/workflows/docker-image.yml/badge.svg?branch=main)](https://github.com/AndriyKalashnykov/gatsby-demo/actions/workflows/docker-image.yml)
# Gatsby demo project

## Pre-requisites

* [Docker](https://docs.docker.com/engine/install/)
* [curl](https://help.ubidots.com/en/articles/2165289-learn-how-to-install-run-curl-on-windows-macosx-linux)
* [nvm](https://github.com/nvm-sh/nvm) - Optional, only if you planning too build the project locally

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install 16
nvm use 16
```

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

## Build locally

```bash
npm install --global yarn
yarn install --network-timeout 1000000 && yarn build
```