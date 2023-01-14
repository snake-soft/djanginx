
# djanginx

Dockerized Nginx for serving static and media files.
It creates a default_site that returns 444.
The main server configuration listens only to the defined domain to avoid django errors.


# Environment variables

| Name                       | Type          | Default     | Description                                       |
| ---------------------------| ------------- | ----------- | ------------------------------------------------- |
| LISTEN_DOMAIN              | String        | _           | External Domain to listen for (required!)         |
| DJANGO_STATIC_URL          | String        | static      | Djangos settings.STATIC_URL                       |
| DJANGO_STATIC_ROOT_DIR     | String        | static_root | Container static_root directory relative to /app) |
| DJANGO_MEDIA_URL           | String        | media       | Djangos settings.MEDIA_URL                        |
| DJANGO_MEDIA_DIR           | String        | media       | Container media directory relative to /app)       |
| SITE_HOSTNAME              | String        | site        | Hostname of the django container                  |
| SITE_PORT                  | String        | 8000        | Port of the django container                      |


# Map your Django project

```
django_1:
  volumes:
    - django_media:/app/media/:rw
    - django_static:/app/static_root/:rw
  command: "python3 -m daphne -b 0.0.0.0 -p 8000 config.asgi:application"

web_1:
  image: docker.io/snakesoft/djanginx:latest
  ports:
    - "80:80"
  volumes:
    - django_media:/app/media/:ro
    - django_static:/app/static_root/:ro
  environment:
    LISTEN_DOMAIN: yourdomain.com
    SITE_HOSTNAME: django_1
```

Instead of "SITE_HOSTNAME: django_1" you can use:

```
  links:
    - site_1:site
```
