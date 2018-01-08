FROM nginx:1.13-alpine
LABEL maintainer="Leif Gensert <leif@leif.io>"

# install necessary dependencies
RUN apk add --no-cache --virtual .run-deps \
    ca-certificates openssl \
    && update-ca-certificates

# reset default config
RUN rm /etc/nginx/conf.d/*

COPY nginx.conf /etc/nginx/nginx.conf
