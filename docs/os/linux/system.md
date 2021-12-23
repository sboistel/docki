# SYSTEM

# Command

## Bash $VALUES

Contient le nom du script tel qu'il a été invoqué: 
> $0

L'ensembles des paramètres sous la forme d'un seul argument:
> $*

L'ensemble des arguments, un argument par paramètre:
>  $@

Le nombre de paramètres passés au script:
> $#

Le code retour de la dernière commande::
> $?

Le PID su shell qui exécute le script:
> $$

Le PID du dernier processus lancé en arrière-plan:
> $!

# Process

## CPU

Lister le nombre de processeur :

```bash
nproc
```

## Processus

Comment utiliser ps ?

Lister tout les processus :

- a : Ayant un terminal de contrôle
- u : Lancés par l'/es utilisateur(s)
- x : N'ayant pas de terminal de contrôle (TTY)
- e : Tout les processe
- d : Tout les processes sauf ceux de la session courante
- l : Liste longue
- f : Full -> Avoir le nom complet du processus

## Load
Check the load average fixed by the system:

```bash
cat /proc/loadavg
```

Verify time since the system is up:

```bash
uptime
```

You could check your system processes by top/htop or glances and more one else:

```bash
top
```

You can folow your CPU in real time by this command:

```bash
vmstat -w 1
```

# Service

## Systemctl

How to list enabled unit-file.

```bash
systemctl list-unit-files | grep enabled
```

# Application

## lamp

Apache check config :

```bash
/opt/lampp/bin/httpd -t
```

Apache restart :

```bash
/opt/lampp/bin/httpd -k restart
```

## Postfix

Basic postfix configuration `/etc/postfix/main.cf` :

```bash
relayhost = [smtp.gmail.com]:587
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
```

# Automation

## Logrotate

1. Check :

```bash
logrotate -d /etc/logrotate.d/httpd
```

2. Apply :
```bash
logrotate -vf /etc/logrotate.d/httpd
```

# Network

## iP Adress

Public iP :

```bash
curl ifconfig.me 
```
```bash
curl ifconfig.co
```

Private iP :

```bash
hostname -i
```

## DEB

File : `/etc/network/interfaces` :

```bash
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet static
    address 10.0.0.41
    netmask 24
    gateway 10.0.0.0
    dns-nameservers 10.0.0.1 8.8.8.8
```

# Screen

## Blank Screen

Retirer la mise en veille lors de la fermeture du capot de l’ordinateur portable.

```bash
   setterm-powersave off -blank 0
   systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

# Account

## Useradd

How to adding user ?

```bash
useradd -s /sbin/nologin -G $GRP
useradd -m -G wheel -s /bin/bash $account
```

## Lock / Unlock

Check password status :
```bash
passwd -S $USER
```

Status list :
* LK: Password locked
* NP: No password
* PS: Password set

### Unlock

Use the `-u` to unlock account
```bash
passwd -u $USER
```

### Lock

Use the `-L` to lock account
```bash
passwd -L $USER
```

### Time life password

Show the account password information
```bash
chage -l $USER
```

Set minimum day
```bash
chage -m ${NOMBER OF DAY} ${USER}
```

## Sudoers

Autorisation de l’utilisateur max de supprimer dans le dossier. 

```bash
max ALL=NOPASSWD:/bin/rm -rf $CHEMIN_de_DOSSIER/*
```

Autorisation pour l’utilisateur matry_mc_fly de lire les fichiers dans le dossier.

```bash
marty_mc_fly ALL=NOPASSWD:/usr/bin/cat /var/log/mariadb/*
```

## Key

###  PEM Key

Create pem key :

```bash
Puttygen mykey.ppk -O private-openssh -o mykey.pem
```

# Time/Date

## Clock
How to mod sys clock ?

```bash
mv /etc/localtime /etc/localtime.backup
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime

echo "Europe/Paris" | tee /etc/timezone
timedatectl set-timezone Europe/Paris
hwclock -s
```

# Touchscreen

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
