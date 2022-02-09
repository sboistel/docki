# Applications
Created Wednesday 26 January 2022

Screen
------

### Touchscreen
How to disable touchscreen at start ?
Create a new file as `/etc/X11/xorg.conf.d/01-no_touchscreen.conf` as 664 :

```bash
# Written by systemd-localed(8), read by systemd-localed and Xorg. Its
# probably wise not to edit this file manually. use localectl(1) to
# instruct systemd-localed to update it
Section "InputClass"
Identifier "Raydium catchall"
MatchIsTouchscreen "on"
Option "Ignore" "on"
EndSection
```

Using command line :

```bash
xinput disable $(xinput list | awk '/Touchscreen/ {print $5}' | cut -d "=" -f2)
```

### Blank Screen

Retirer la mise en veille lors de la fermeture du capot de l’ordinateur portable.

```bash
   setterm-powersave off -blank 0
   systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

lamp
----
Apache check config :

```bash
/opt/lampp/bin/httpd -t
```

Apache restart :

```bash
/opt/lampp/bin/httpd -k restart
```

Postfix
-------
Basic postfix configuration `/etc/postfix/main.cf` :

```bash
relayhost = [smtp.gmail.com]:587
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
```

Logrotate
---------

### 1. Check :

```bash
logrotate -d /etc/logrotate.d/httpd
```

### 2. Apply :
```bash
logrotate -vf /etc/logrotate.d/httpd
```

