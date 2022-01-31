FROM node:14 as builder
WORKDIR /app
COPY ./package.json /app/package.json
COPY ./package-lock.json /app/package-lock.json
COPY . .

RUN yarn install && yarn build


FROM nginxinc/nginx-unprivileged:1.21.3
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/public /usr/share/nginx/html
