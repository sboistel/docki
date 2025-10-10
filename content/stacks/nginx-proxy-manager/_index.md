---
title: Nginx Proxy Manager
description: A simple, powerful, and full-featured web proxy management tool
---

## Docker compose

```yml
---
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    container_name: nginx-proxy-manager
    ports:
      - '80:80'
      - '81:81'
      - '443:443'

    environment:
      DISABLE_IPV6: 'true'

    volumes:
      - /opt/docker/nginx-proxy-manager/data:/data
      - /opt/docker/nginx-proxy-manager/letsencrypt:/etc/letsencrypt
      - /opt/docker/nginx-proxy-manager/letsencrypt-log:/tmp/letsencrypt-log
      - /opt/docker/nginx-proxy-manager/data/logs:/data/logs

    healthcheck:
        test: ["CMD", "/usr/bin/check-health"]
        interval: 10s
        timeout: 3s

networks:
  default:
    external: true
    name: external
```
