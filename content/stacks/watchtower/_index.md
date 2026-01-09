---
title: Watchtower
description: A process for automating Docker container base image updates
---

## Description

Watchtower is a process for automating Docker container base image updates. It monitors running containers and automatically updates them whenever a new image is available, helping to keep your Docker environment up-to-date and secure.

![Overview](https://media.licdn.com/dms/image/v2/D5612AQFz2r_LODFJWw/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1700195983497?e=2147483647&v=beta&t=rQ0m3_GQB7VnzT2opa6yDEhlau7-0U1Aid5iFm41AGQ)

## Docker compose

```yml
---
services:
  # https://containrrr.dev/watchtower/
  watchtower:
    env_file: .env
    image: containrrr/watchtower
    restart: unless-stopped
    container_name: watchtower
    # ports:
    #   - "3443:3443"
    #   - "3080:3080"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /etc/localtime:/etc/localtime:ro
```

## Environment variables

```env
# SMTP
WATCHTOWER_NOTIFICATIONS=email # Enable email notifications
WATCHTOWER_NOTIFICATION_EMAIL_FROM=<your email> # Your email address
WATCHTOWER_NOTIFICATION_EMAIL_TO=<your email> # Can be a comma-separated list
WATCHTOWER_NOTIFICATION_EMAIL_SERVER=smtp.gmail.com # Your SMTP server
WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PORT=587 # 465 for SSL, 587 for TLS
WATCHTOWER_NOTIFICATION_EMAIL_SERVER_USER=<your email> # Your email address
WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PASSWORD=<your password> # Consider using an app password
WATCHTOWER_NOTIFICATION_EMAIL_DELAY=2 # minutes
WATCHTOWER_NOTIFICATIONS_LEVEL=info # info, warning, error

# Rolling restart
WATCHTOWER_ROLLING_RESTART=true # Enable rolling restarts

# Schedule
WATCHTOWER_SCHEDULE=0 0 5 * * * # Daily at 5am

# Notification
WATCHTOWER_NOTIFICATIONS_HOSTNAME=draxpi # Hostname to use in notifications
```
