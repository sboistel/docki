---
title: Linkding
description: A simple, self-hosted bookmark manager
---

## Description

Linkding is a simple, self-hosted bookmark manager that helps you keep track of your favorite links. It offers a clean and user-friendly interface, making it easy to organize, tag, and search your bookmarks. Linkding supports features like bulk import/export, tagging, and a REST API for advanced users.

![Linkding Overview](https://linkding.link/linkding-screenshot-dark.png)

## Docker compose

```yml
---
services:
  linkding:
    container_name: linkding
    image: sissbruecker/linkding:latest
    ports:
      - 9090:9090
    volumes:
      - ./data/data/:/etc/linkding/data
    restart: unless-stopped
```

* ref: https://github.com/sissbruecker/linkding/blob/master/.env.sample
