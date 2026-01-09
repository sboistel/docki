---
title: Vaultwarden
description: A self-hosted password manager
---

## Description

Vaultwarden (formerly known as Bitwarden_RS) is an unofficial implementation of the Bitwarden server API written in Rust. It is a lightweight and efficient password manager that can be self-hosted, providing users with a secure way to store and manage their passwords and other sensitive information.

![Overview](https://bitwarden.com/assets/5Mfud6suR4cxrCb0s6W5kL/f94ba88c8f364537ca4ab456f1300751/Home_Hero_-_Dark.png?w=1200&fm=avif)

## Docker compose

```yml
---
services:
  vaultwarden:
    image: vaultwarden/server:latest
    container_name: vaultwarden
    env_file: .env
    restart: unless-stopped
    volumes:
      - /opt/docker/vaultwarden/data:/data/
    ports:
      - 3012:3012
      - 8080:80
```

## Environment variables

```env
# Vaultwarden settings
DOMAIN=https://<your-domain>
LOGIN_RATELIMIT_MAX_BURST=10
LOGIN_RATELIMIT_SECONDS=60
ADMIN_RATELIMIT_MAX_BURST=10
ADMIN_RATELIMIT_SECONDS=60
ADMIN_TOKEN=<ARGON2_HASHED_TOKEN>
SENDS_ALLOWED=true
EMERGENCY_ACCESS_ALLOWED=true
WEB_VAULT_ENABLED=true
SIGNUPS_ALLOWED=false
SIGNUPS_VERIFY=true
SIGNUPS_VERIFY_RESEND_TIME=3600
SIGNUPS_VERIFY_RESEND_LIMIT=5
SIGNUPS_DOMAINS_WHITELIST=<your-domain>
SMTP_HOST=smtp.gmail.com
SMTP_FROM=<SMTP_EMAIL_ADDRESS>
SMTP_FROM_NAME=<YOUR_NAME>
SMTP_SECURITY=starttls
SMTP_PORT=587
MAIL_ACCOUNT=<SMTP_EMAIL_ADDRESS>
MAIL_PASSWORD=<SMTP_PASSWORD>
```

Replace the placeholders (e.g., `<your-domain>`, `<ARGON2_HASHED_TOKEN>`, `<SMTP_EMAIL_ADDRESS>`, `<YOUR_NAME>`, `<SMTP_PASSWORD>`) with your actual values.

### Generate argon2id hashed token

You can generate an Argon2 hashed token using the following command:

```bash
docker run --rm authelia/authelia:latest authelia crypto hash generate argon2 --password "<YOUR_ADMIN_TOKEN>" | awk '{print $2}'
```

Example output:

```bash
$ docker run --rm authelia/authelia:latest authelia crypto hash generate argon2 --password "toto" | awk '{print $2}'
$argon2id$v=19$m=65536,t=3,p=4$CLX8LLS43Sk8ZQUXF4Gt3Q$BzxQBe3FtKca+rhF5ZFxPYXS4Cfcm6ts2r2lHErq3kc
```
