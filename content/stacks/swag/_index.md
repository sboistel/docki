---
title: SWAG Proxy Manager
description: Secure Web Application Gateway (SWAG) is a Docker container that provides a reverse proxy, SSL termination, and web application firewall capabilities.
---

## Description

Secure Web Application Gateway (SWAG) is a Docker container that provides a reverse proxy, SSL termination, and web application firewall capabilities. It is designed to simplify the deployment and management of web applications by handling tasks such as SSL certificate management, traffic routing, and security enhancements.

![Overview](https://static.cachem.fr/uploads/2022/03/dashboard.webp)

## Docker Compose

```yml
---
services:
  swag:
    image: lscr.io/linuxserver/swag:latest
    container_name: swag
    cap_add:
      - NET_ADMIN
    env_file:
      - .env
    environment:
      - TZ=Europe/Paris
      - URL=${DOMAIN}
      - SUBDOMAINS=wildcard # use 'wildcard' for a wildcard certificate
      - VALIDATION=dns # use 'http' for HTTP validation or 'dns' for DNS validation
      - DNSPLUGIN=${PLUGIN} # e.g., cloudflare, duckdns, etc.
      - EMAIL=${EMAIL} # your email for cert notifications
      - DOCKER_MODS=linuxserver/mods:swag-dbip|linuxserver/mods:swag-dashboard|linuxserver/mods:swag-auto-reload
    volumes:
      - ./data:/config
    ports:
      - 80:80
      - 443:443
      - 81:81
    restart: unless-stopped
    networks:
      - external

networks:
  default:
    name: external
        external: true
```

## Environment Variables

```env
DOMAIN=<your-domain>
EMAIL=<your-email>
PLUGIN=<your_dns_plugin> # e.g., cloudflare, duckdns, etc.
```
