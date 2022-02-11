[![Docker Image CI](https://github.com/AndriyKalashnykov/gatsby-demo/actions/workflows/docker-image.yml/badge.svg?branch=main)](https://github.com/AndriyKalashnykov/gatsby-demo/actions/workflows/docker-image.yml)
[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FAndriyKalashnykov%2Fgatsby-demo&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
# Gatsby demo project

## Pre-requisites

* [Docker](https://docs.docker.com/engine/install/)
* [curl](https://help.ubidots.com/en/articles/2165289-learn-how-to-install-run-curl-on-windows-macosx-linux)
* [nvm](https://github.com/nvm-sh/nvm) - Optional, only if you planning too build the project locally

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$(curl -sL https://api.github.com/repos/nvm-sh/nvm/releases/latest  | grep '"tag_name":' | awk -F '"' '{printf("%s",$4)}' | cut -c 2-)/install.sh | bash
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

## Build project locally

```bash
npm install --global yarn
yarn install --network-timeout 1000000 && yarn build
```
