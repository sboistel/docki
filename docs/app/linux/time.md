---
title: "Clock"
description: "How to mod sys clock ?"
tags: ["linux", "time"]
---

How to mod sys clock ?

```bash
mv /etc/localtime /etc/localtime.backup
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
```

```bash
echo "Europe/Paris" | tee /etc/timezone
timedatectl set-timezone Europe/Paris
hwclock -s
```
