ARG DOCKER_REPO

# Vue Cli 3
FROM alpine as vue-cli-3

RUN \
  apk add npm --no-cache && \
  npm i yarn -g && \
  # work directories
  mkdir /code && \
  # node packages
  yarn global add @vue/cli && \
  echo ''

WORKDIR /code

# Vue Cli 3 Development
FROM ${DOCKER_REPO}vue-cli-3 as vue-cli-3-dev

COPY ./src/.npmrc /root/
COPY ./src/.yarnrc /root/

RUN \
  apk add nginx git --no-cache && \
  echo ''

COPY ./src/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443 8080 8000
ENTRYPOINT ["/bin/sh"]

# Static as Service
FROM alpine as static-service

RUN \
  apk add nginx --no-cache && \
  mkdir /srv/web-app && \
  echo ''

COPY ./src/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 81

CMD ["nginx", "-g", "daemon off;"]
