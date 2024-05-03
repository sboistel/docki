---
title: yubikey
description: ""
date: 2024-05-03T16:13:45+02:00
tags: []
categories: []
draft: true
slug: ""
---

---
title: Yubikey
description: Managing Yubikey with PAM
---

## How to

### Requierments

```sh
sudo apt install libpam-u2f pamu2fcfg
```

- /etc/pam.d/sudo
- /etc/pam.d/gdm-password

```sh
## Yubico
auth sufficient pam_u2f.so origin=pam://$HOSTNAME appid=pam://$HOSTNAME authfile=/etc/u2f_mappings cue
```

### Gen u2f mapping

- /etc/u2f_mappings

```sh
pamu2fcfg -u `whoami` -opam://`hostname` -ipam://`hostname` -N
```
