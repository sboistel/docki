---
title: logfile
description: ""
date: 2024-05-03T16:13:45+02:00
tags: []
categories: []
draft: true
slug: ""
---

## Logrotate

#### Check

```bash
logrotate -d /etc/logrotate.d/httpd
```

#### Apply

```bash
logrotate -vf /etc/logrotate.d/httpd
```
