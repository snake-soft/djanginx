FROM nginx:1.23.3

COPY ./nginx/templates/default.conf.template /etc/nginx/templates/

ENV LISTEN_DOMAIN="_"
ENV DJANGO_STATIC_URL="static"
ENV DJANGO_STATIC_ROOT_DIR="static_root"
ENV DJANGO_MEDIA_URL="media"
ENV SITE_HOSTNAME=site
ENV SITE_PORT=8000
