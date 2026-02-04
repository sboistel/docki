---
title: What's Up Docker?
description: A curated collection of Docker resources, tutorials, and best practices to help you get the most out of containerization.
---

## Description

"What's Up Docker?" is your go-to resource for all things Docker. Whether you're a beginner looking to get started with containerization or an experienced developer seeking advanced tips and best practices, this collection has something for you. Explore tutorials, guides, and curated resources to enhance your Docker skills and streamline your development workflow.

![Overview](https://getwud.github.io/wud/assets/wud-arch.png)

## Docker Compose

```yml
---
# https://getwud.github.io/wud
---
services:
  whatsupdocker:
    image: getwud/wud
    container_name: wud
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    ports:
      - 3000:3000
    env_file: .env
    restart: unless-stopped
    healthcheck:
      test: curl --fail http://localhost:${WUD_SERVER_PORT:-3000}/health || exit 1
      interval: 10s
      timeout: 10s
      retries: 3
      start_period: 10s
```

## Environment Variables

```env
WUD_WATCHER_LOCAL_CRON=0 5 * * *
WUD_TRIGGER_DOCKER_LOCAL_PRUNE=true
# WUD_TRIGGER_DOCKER_LOCAL_DRYRUN=true

# https://getwud.github.io/wud/#/configuration/authentications/
# docker run --rm backplane/htpasswd -nib "jdoe" "joepassword"
WUD_AUTH_BASIC_JDOE_USER=jdoe
WUD_AUTH_BASIC_JDOE_HASH=$apr1$TtYH0/EL$wwnc0CbHzfkzNzBfqy3es0


# https://getwud.github.io/wud/#/configuration/logs/
WUD_LOG_LEVEL=info
WUD_LOG_FORMAT=json

# https://getwud.github.io/wud/#/configuration/timezone/
TZ=Europe/Paris

## https://getwud.github.io/wud/#/configuration/triggers/ntfy/
WUD_TRIGGER_NTFY_LOCAL_URL=https://<YourDomain>/wud
WUD_TRIGGER_NTFY_LOCAL_TOPIC="What's Up Docker - Updates"
WUD_TRIGGER_NTFY_LOCAL_AUTH_TOKEN="tk_yourtokenhere" # if needed

# https://getwud.github.io/wud/#/configuration/watchers/
WUD_WATCHER_LOCAL_WATCHALL=true

# https://getwud.github.io/wud/#/configuration/watchers/?id=labels
# INTO COMPOSE.YML TO DISABLE A CONTAINER FROM BEING WATCHED:
# labels:
#   - "wud.watch=false"
```
