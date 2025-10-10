---
title: IT Tools
description: A collection of web-based IT tools in a single container
---

## Docker compose

```yml
---
services:
    it-tools:
        container_name: it-tools
        image: 'corentinth/it-tools:latest'
          #        ports:
          #            - '8181:80'
        restart: unless-stopped

networks:
  default:
    external: true
    name: external
```
