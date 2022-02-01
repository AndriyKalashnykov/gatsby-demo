FROM node:14.17 as builder
WORKDIR /app
COPY ./package.json /app/package.json
COPY ./yarn.lock /app/yarn.lock
COPY . .

RUN yarn install --network-timeout 1000000 && yarn build

FROM nginxinc/nginx-unprivileged:1.21.3
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/public /usr/share/nginx/html
