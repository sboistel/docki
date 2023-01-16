# Network

Network files (depend of distro)

=== "DEB: /etc/network/interfaces"

    ``` shell
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

=== "RPM: /etc/sysconfig/network-scripts/ifcfg-eth0"

    ``` shell
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

# SMTP

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