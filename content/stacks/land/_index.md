---
title: Landing Page
description: A simple static landing page using Nginx
---

## Docker compose

```yml
---
services:
  landing-page:
    image: nginx:latest
    container_name: landing-page
    restart: unless-stopped
    volumes:
      - ./data/html:/usr/share/nginx/html:ro
    # ports:
    #   - '8880:80'
networks:
  default:
    external: true
    name: external
```
