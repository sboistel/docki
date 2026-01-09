---
title: Nextcloud
description: A suite of client-server software for creating and using file hosting services
---

## Description

Nextcloud is a suite of client-server software for creating and using file hosting services. It is free and open-source, which allows anyone to install and operate it on a private server. Functionality includes file storage, sharing, calendar, contacts, mail, and more. Nextcloud is often used as an alternative to proprietary services like Dropbox, Google Drive, or iCloud, providing users with greater control over their data and privacy.*

![Nextcloud Overview](https://raw.githubusercontent.com/nextcloud/screenshots/master/nextcloud-hub-files-25-preview.png)

## Docker compose

```yml
---
services:
  db:
    image: mariadb
    container_name: ncloud_db
    restart: unless-stopped
    command: --transaction-isolation=READ-COMMITTED --binlog-format=ROW
    env_file: .env
    volumes:
      - ./db:/var/lib/mysql

  app:
    image: nextcloud
    container_name: ncloud_app
    restart: unless-stopped
    ports:
      - 8080:80
    depends_on:
      - db
    links:
      - db
    env_file: .env
    volumes:
      - ./app:/var/www/html
      - ./data:/var/www/html/data
```
