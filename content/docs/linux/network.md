---
title: "Network"
description: "Managing and monitoring network configurations in Linux"
tags: ["linux", "network"]
---

## Network files distribution.s

{{% details title="Ubuntu / Debian" closed="true" %}}
  ```shell filename="/etc/netplan/00-installer-config.yaml"
  # This is the network config written by 'subiquity'
  network:
    ethernets:
      ens18:
        addresses:
        - 10.0.0.x/24
        nameservers:
          addresses:
          - 10.0.0.1
          search:
          - 10.0.0.1
        routes:
        - to: default
          via: 10.0.0.1
    version: 2
  ```
{{% /details %}}

{{% details title="Red Hat / CentOS / Rocky Linux" closed="true" %}}
  ```shell filename="/etc/netplan/00-installer-config.yaml"
  TYPE=Ethernet
  PROXY_METHOD=none
  BROWSER_ONLY=no
  BOOTPROTO=none
  DEFROUTE=yes
  IPV4_FAILURE_FATAL=no
  IPV6INIT=no
  NAME=eth0
  UUID=67c4................f5d569
  DEVICE=eth0
  ONBOOT=yes
  IPV6_DISABLED=yes
  IPADDR=10.0.0.x
  PREFIX=24
  GATEWAY=10.0.0.1
  ```
{{% /details %}}
