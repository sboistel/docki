---
title: Nextcloud
description: A suite of client-server software for creating and using file hosting services
---

## Docker compose

```yml
---
services:
  db:
    image: mariadb
    container_name: ncloud_db
    restart: unless-stopped
    command: --transaction-isolation=READ-COMMITTED --binlog-format=ROW
    # command: >
    #   --skip-grant-tables 
    #   --transaction-isolation=READ-COMMITTED 
    #   --binlog-format=ROW
    #   --ssl=false
    env_file: .env
    volumes:
      - ./db:/var/lib/mysql

  app:
    image: nextcloud
    container_name: ncloud_app
    restart: unless-stopped
    depends_on:
      - db
    links:
      - db
    env_file: .env
    volumes:
      - ./app:/var/www/html
      - ./data:/var/www/html/data

networks:
  default:
    external: true
    name: external
```
