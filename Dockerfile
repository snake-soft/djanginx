FROM nginx:1.23.3

COPY ./nginx/templates/default.conf.template /etc/nginx/templates/

ARG HASH="Unknown"
RUN echo "${HASH}" > /app/HASH

ARG VERSION=0.0.0
RUN echo "${VERSION}" > /app/VERSION

ENV LISTEN_DOMAIN="_"
ENV DJANGO_STATIC_URL="static"
ENV DJANGO_STATIC_ROOT_DIR="static_root"
ENV DJANGO_MEDIA_URL="media"
ENV DJANGO_MEDIA_DIR="media"
ENV SITE_HOSTNAME=site
ENV SITE_PORT=8000
