---
title: "Ntfy"
description: "A simple and lightweight notification service."
---

## Description

Ntfy is a simple and lightweight notification service that allows you to send push notifications to your devices via HTTP or MQTT. It is designed to be easy to set up and use, making it a great choice for personal or small-scale notification needs.

Github: [github.com/binwiederhier/ntfy](https://github.com/binwiederhier/ntfy)

## Docker Compose

```yml
services:
  ntfy:
    image: binwiederhier/ntfy
    container_name: ntfy
    command:
      - serve
    environment:
      - TZ='Europe/Paris'    # optional: set desired timezone
    # user: UID:GID # optional: replace with your own user/group or uid/gid
    volumes:
      - ./data/lib/ntfy:/var/lib/ntfy
      - ./data/etc/server.yml:/etc/ntfy/server.yml
    ports:
      - 8001:80
    healthcheck: # optional: remember to adapt the host:port to your environment
        test: ["CMD-SHELL", "wget -q --tries=1 http://localhost:80/v1/health -O - | grep -Eo '\"healthy\"\\s*:\\s*true' || exit 1"]
        interval: 60s
        timeout: 10s
        retries: 3
        start_period: 40s
    restart: unless-stopped
    init: true # needed, if healthcheck is used. Prevents zombie processes
```

## Configuration

List currents users:

```bash
docker exec -it ntfy ntfy user list
```

Create users with:

```bash
docker exec -it ntfy ntfy user add <username> --password=<password>
```

Change user password:

```bash
docker exec -it ntfy ntfy user change-pass <username>
```

Delete user:

```bash
docker exec -it ntfy ntfy user del <username>
```

Create user token:

```bash
docker exec -it ntfy ntfy token add <username>
```

That also possible to manage users from etc/ntfy/server.yml file. More info about configuration can be found here: [Configuration Documentation](https://docs.ntfy.sh/config/#users-via-the-config).

```yaml
auth-users:
    - "toto:$2a$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36c6B8ftk5U3y6pG1KqkXW:admin"
    - "eve:$2a$10$7eqJtq98hPqEX7fNZaFWoOHi6r5H3ZUxW7p6N5b5p5p5p5p5p5p5e:user"

auth-access:
  - "titi:*:rw"

auth-tokens:
    - "toto:tk_3e9c7ae6150a4fe18f8b8231a458bca0"
    - "eve:tk_4fe1bca03e9c7ae68f8b8231a458bca1"
```

## Usage

```bash
curl -d "Hello, World!" https://ntfy.<YourDomain>/topic
```

Basic authentication:

```bash
curl \
  -u testuser:fakepassword \
  -d "Look ma, with auth" \
  https://ntfy.example.com/mysecrets
```

Using token authentication:

```bash
curl \
  -H "Authorization: Bearer tk_4fe1bca03e9c7ae68f8b8231a458bca1" \
  -d "Look ma, with token auth" \
  https://ntfy.<YourDomain>/mysecrets
```

[shoutrrr](https://github.com/containrrr/shoutrrr) :

```txt
ntfy://:tk_4fe1bca03e9c7ae68f8b8231a458bca1@ntfy.<YourDomain>/loggifly

ntfy://username:password@host/topic
ntfy://:accesstoken@host/topic
```

More info about usage can be found here: [Usage Documentation](https://docs.ntfy.sh/publish/).