---
title: RustDesk
description: An open-source remote desktop application designed for self-hosting, as an alternative to Team
---

## Docker compose

```yml
---
services:
  hbbs:
    container_name: rustdesk-hbbs
    image: rustdesk/rustdesk-server:latest
    command: hbbs
    volumes:
      - /opt/docker/rustdesk/data:/root
    network_mode: "host"
    # ports:
    #   - 21116:21116 # (TCP/UDP): Please note that 21116 should be enabled both for TCP and UDP. 21116/UDP is used for the ID registration and heartbeat service. 21116/TCP is used for TCP hole punching and connection service.
    #   - 21118:21118 # (TCP): used to support web clients.
    depends_on:
      - hbbr
    restart: unless-stopped
    labels:
      glance.parent: rustdesk
      glance.name: RustDesk HBBS

  hbbr:
    container_name: rustdesk-hbbr
    image: rustdesk/rustdesk-server:latest
    command: hbbr
    volumes:
      - /opt/docker/rustdesk/data:/root
    # ports:
    #   - 21117:21117 # (TCP): used for the Relay services.
    #   - 21119:21119 # (TCP): used to support web clients.
    network_mode: "host"
    restart: unless-stopped
    labels: # https://github.com/glanceapp/glance/blob/main/docs/configuration.md#docker-containers
      glance.name: RustDesk
      glance.id: rustdesk
      glance.icon: si:rustdesk
      glance.url: https://ncloud.sboistel.fr/s/5xkPrpet7RSAZWM # https://rdesk.sboistel.fr
      glance.description: An open-source remote desktop application designed for self-hosting, as an alternative to TeamViewer.

networks:
  default:
    external: true
    name: external
```
