---
title: web
description: ""
date: 2024-05-03T16:13:45+02:00
tags: []
categories: []
draft: true
slug: ""
---

## Web

## lamp

Apache check config :

```bash
/opt/lampp/bin/httpd -t
```

Apache restart :

```bash
/opt/lampp/bin/httpd -k restart
```

## Postfix

Basic postfix configuration `/etc/postfix/main.cf` :

```bash
relayhost = [smtp.gmail.com]:587
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
```
