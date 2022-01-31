# Gatsbdy demo project


## Build unprivileged docker image

```bash
DOCKER_BUILDKIT=1 docker build -t gatsby-nginx .
```

## Run docker container

```bash
docker run --rm -it -p 8080:8080 gatsby-nginx

```
## Open app in browser

```bash
xdg-open http://localhost:8080/
```