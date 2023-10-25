# Network

!!! exemple "Network files distribution.s"

    === "Ubuntu / Debian"

        ```shell title="/etc/netplan/00-installer-config.yaml"
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
        ```shell title="/etc/network/interfaces - (hold)"
        ## This file describes the network interfaces available on your system
        ## and how to activate them. For more information, see interfaces(5).

        ## The loopback network interface
        auto lo
        iface lo inet loopback

        ## The primary network interface
        auto eth0
        iface eth0 inet static
        address 10.0.0.x
        netmask 24
        gateway 10.0.0.1
        dns-nameservers 10.0.0.1 8.8.8.8
        ```

    === "Red Hat / CentOS / Rocky Linux ..."

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
        IPADDR=10.0.0.x
        PREFIX=24
        GATEWAY=10.0.0.1
        ```