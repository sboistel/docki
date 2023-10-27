```yaml
# https://github.com/laurent22/joplin/blob/dev/docker-compose.server.yml

version: '3'

services:
    db:
        image: postgres:15
        volumes:
            - joplindb:/var/lib/postgresql/data
        ports:
            - "5432:5432"
        restart: unless-stopped
        environment:
            - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
            - POSTGRES_USER=${POSTGRES_USER}
            - POSTGRES_DB=${POSTGRES_DB_NAME}
    app:
        image: joplin/server:latest
        depends_on:
            - db
        ports:
            - "22300:22300"
        restart: unless-stopped
        environment:
            - APP_PORT=22300
            - APP_BASE_URL=${APP_URL}
            - DB_CLIENT=db
            - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
            - POSTGRES_DATABASE=${POSTGRES_DB_NAME}
            - POSTGRES_USER=${POSTGRES_USER}
            - POSTGRES_PORT=5432
            - POSTGRES_HOST=db
            - MAILER_ENABLED=1
            - MAILER_HOST=smtp.gmail.com
            - MAILER_PORT=465
            - MAILER_SECURE=1
            - MAILER_AUTH_USER=${MAIL_ACCOUNT}
            - MAILER_AUTH_PASSWORD=${MAIL_PASSWORD}
            - MAILER_NOREPLY_NAME=${MAIL_NRP_NAME}
            - MAILER_NOREPLY_EMAIL=${MAIL_ACCOUNT}

volumes:
  joplindb:
```