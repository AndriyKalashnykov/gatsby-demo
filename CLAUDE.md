# CLAUDE.md — gatsby-demo

## Project Overview

Gatsby.js demo project that builds a static site and packages it into an unprivileged Nginx Docker image. The site is built with Gatsby v2, React 17, and served via `nginxinc/nginx-unprivileged`.

- **Owner:** AndriyKalashnykov/gatsby-demo
- **License:** MIT
- **Language:** JavaScript (Node 16, Yarn)
- **Framework:** Gatsby v2

## Repository Layout

```
src/pages/        — Gatsby page components
nginx/            — Nginx configuration (nginx.conf)
Dockerfile        — Multi-stage build: Node builder + Nginx runtime
gatsby-config.js  — Gatsby configuration (plugins, site metadata)
gatsby-browser.js — Browser-side Gatsby APIs
gatsby-node.js    — Node-side Gatsby APIs
```

## Build & Run

```bash
# Install dependencies and build static site
yarn install --network-timeout 1000000 && yarn build

# Build Docker image
DOCKER_BUILDKIT=1 docker build -t gatsby-nginx:latest .

# Run container (serves on port 8080)
docker run --rm -it -p 8080:8080 gatsby-nginx:latest
```

## CI/CD

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| `docker-image.yml` | push (main), tags (`v*`), PRs | Build Docker image; push to DockerHub on tag |
| `cleanup-runs.yml` | weekly schedule, manual | Delete old workflow runs (retain 7 days / 5 minimum) |

## Coding Conventions

- Prettier for formatting (`devDependencies`)
- Gatsby CLI commands via `yarn`/`npm` scripts: `build`, `develop`, `start`, `serve`, `clean`
