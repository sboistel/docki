---
title: Linkding
description: A simple, self-hosted bookmark manager
---

## Docker compose

```yml
---
services:
  linkding:
    container_name: linkding
    # env_file: .env
    image: sissbruecker/linkding:latest
      #    ports:
      #      - 9090:9090
    volumes:
      - ./data/data/:/etc/linkding/data
    restart: unless-stopped

networks:
  default:
    external: true
    name: external
```

* ref: https://github.com/sissbruecker/linkding/blob/master/.env.sample
