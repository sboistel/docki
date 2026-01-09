---
title: RustDesk
description: An open-source remote desktop application designed for self-hosting, as an alternative to Team
---

## Description

[RustDesk](https://rustdesk.com/) is an open-source remote desktop application that allows users to access and control their computers remotely. It is designed to be a self-hosted alternative to proprietary remote desktop solutions like TeamViewer and AnyDesk.

## Requirements

- A server or VPS with a public IP address to host the RustDesk server components (hbbs and hbbr).
- Docker and Docker Compose installed on the server.
- Basic knowledge of Docker and networking.

### Oppened ports

- 21116 (TCP/UDP): Please note that 21116 should be enabled both for TCP and UDP. 21116/UDP is used for the ID registration and heartbeat service. 21116/TCP is used for TCP hole punching and connection service.
- 21117 (TCP): used for the Relay services.
- 21118 (TCP): used to support web clients.
- 21119 (TCP): used to support web clients.

## Docker compose

```yml
---
services:
  hbbs:
    container_name: rustdesk-hbbs
    image: rustdesk/rustdesk-server:latest
    command: hbbs
    volumes:
      - ./data:/root
    network_mode: "host"
    ports:
      - 21116:21116 # (TCP/UDP): Please note that 21116 should be enabled both for TCP and UDP. 21116/UDP is used for the ID registration and heartbeat service. 21116/TCP is used for TCP hole punching and connection service.
      - 21118:21118 # (TCP): used to support web clients.
    depends_on:
      - hbbr
    restart: unless-stopped

  hbbr:
    container_name: rustdesk-hbbr
    image: rustdesk/rustdesk-server:latest
    command: hbbr
    volumes:
      - ./data:/root
    ports:
      - 21117:21117 # (TCP): used for the Relay services.
      - 21119:21119 # (TCP): used to support web clients.
    network_mode: "host"
    restart: unless-stopped
```
