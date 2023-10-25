```yaml
version: '3.2'

services:
  db:
    image: postgres
    restart: always
    volumes:
      - db:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=nextcloud
      - POSTGRES_USER=Mavri4
      - POSTGRES_PASSWORD=Mavri4

  app:
    image: nextcloud
    restart: always
    ports:
      - 8080:80
    volumes:
      - nextcloud:/var/www/html
      - /media/galaxy:/media/galaxy
    environment:
      - POSTGRES_HOST=db
      - POSTGRES_DB=nextcloud
      - POSTGRES_USER=Mavri4
      - POSTGRES_PASSWORD=Mavri4
    depends_on:
      - db

  cron:
    image: nextcloud
    restart: always
    volumes:
      - nextcloud:/var/www/html
    entrypoint: /cron.sh
    depends_on:
      - db

volumes:
  db:
  nextcloud:
  ```