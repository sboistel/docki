---
title: vnc-tiger
description: ""
date: 2024-05-03T16:13:45+02:00
tags: []
categories: []
draft: true
slug: ""
---

## VNC Tiger

## VNC Session

How to create new VNC Session ?

### Change the VNCpassword

```bash
vncpassword
```

### Directory

Move to the session direcotry :

```bash
cd /etc/systemd/system
```

### Session file

Copy old vncserver.service file to a new one :
```bash
cp [vncserver@{N°}.service](mailto:vncserver@{N°}.service) vncserver@:{New N°}.service
```

Replace :
```bash
sed -i 's/olduser/newuser/g' vncserver@:{New N°}.service
```

### Service

Enable the service :
```bash
systemctl enable vncserver@:{New N°}.service
```

