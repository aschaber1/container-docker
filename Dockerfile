FROM nginx:1.19.3-alpine

LABEL maintainer="Alexander Schaber (cuegee)"

ENV NGINX_VERSION 1.18.0
ENV NJS_VERSION   0.4.4
ENV PKG_RELEASE   1

RUN set -x \
# create nginx user/group first, to be consistent throughout docker variants
    && apk add --no-cache git \
    && git clone https://github.com/aschaber1/container-app.git /usr/share/nginx/html \
    && rm -rf /usr/share/nginx/html/.git

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]

