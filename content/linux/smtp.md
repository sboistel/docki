---
title: smtp
description: ""
date: 2024-05-03T16:13:45+02:00
tags: []
categories: []
draft: true
slug: ""
---

## SMTP

## Troubleshooting

### TLS

1. Prepare encoded strings for your mail username and password

```bash
echo -ne "mail@example.net" | base64
```

2. Connect to mail server

```bash
openssl s_client -starttls smtp -connect smtp.example.com:587
```

3. Send HELO

```smtp
EHLO
```

4. Authenticate

```smtp
AUTH LOGIN
<your-encoded-username>
<your-encoded-password>
```

If that's successful the mail server should return `235 2.7.0 Authentication successful`.
