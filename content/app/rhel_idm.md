---
title: rhel_idm
description: ""
date: 2024-05-03T16:13:45+02:00
tags: []
categories: []
draft: true
slug: ""
---

## Red Hat Identity Management (IdM)

## Commandes

Show $USER 
```bash
ipa user-show monuser --all
```

## Client

Add Client :
```bash
ipa-client-install --domain=dnsname --server=fqdn --realm=DNSNAME --mkhomedir --ntp-server=iP1 --ntp-server=iP2
```
