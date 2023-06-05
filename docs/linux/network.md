# Network

*Network files (depend of distro)*

## DEB

```shell title="/etc/network/interfaces"
## This file describes the network interfaces available on your system
## and how to activate them. For more information, see interfaces(5).

## The loopback network interface
auto lo
iface lo inet loopback

## The primary network interface
auto eth0
iface eth0 inet static
address 10.0.0.41
netmask 24
gateway 10.0.0.0
dns-nameservers 10.0.0.1 8.8.8.8
```

## RPM

```shell title="/etc/sysconfig/network-scripts/ifcfg-eth0"
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
IPADDR=0.0.0.0
PREFIX=24
GATEWAY=0.0.0.0
```
