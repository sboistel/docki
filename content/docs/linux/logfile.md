---
title: "Logrotate"
description: "Logrotate is a tool that helps manage the rotation of log files in Linux systems."
tags: ["linux", "logrotate"]
---

## Check

```bash
logrotate -d /etc/logrotate.d/httpd
```

## Apply

```bash
logrotate -vf /etc/logrotate.d/httpd
```
