---
title: Landing Page
description: A simple static landing page using Nginx
---

## Description

This stack sets up a simple static landing page using Nginx as the web server. The HTML files for the landing page are served from a specified directory on the host machine.

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
    ports:
      - '8880:80'
```
