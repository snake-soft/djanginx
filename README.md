# djanginx
Dockerized Nginx for serving static and media files


# Map your Django project
```
django:
  volumes:
    - django_media:/app/media/:rw
    - django_static:/app/static_root/:rw
  command: "python3 -m daphne -b 0.0.0.0 -p 8000 config.asgi:application"
  networks:
    <<: *networks
    site_1:
      aliases:
        - site

web_1:
  image: docker.io/snakesoft/djanginx:1
  ports:
    - "${SITE_1_PORT:-8001}:80"
  environment:
    - LISTEN_DOMAIN=yourdomain.com
  volumes:
    - django_media:/app/media/:ro
    - django_static:/app/static_root/:ro
  networks:
    - site_1

networks:
  site_1:
```

# Build
```
docker build -t snakesoft/djanginx:1 .
docker push snakesoft/djanginx:1

docker tag snakesoft/djanginx:1 snakesoft/djanginx:1.1
docker push snakesoft/djanginx:1.0

docker tag snakesoft/djanginx:1 snakesoft/djanginx:1.0.0
docker push snakesoft/djanginx:1.0.0
```
