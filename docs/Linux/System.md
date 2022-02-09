# System
Exit codes
==========

* Contient le nom du script tel qu'il a été invoqué: 
	* > $0
* L'ensembles des paramètres sous la forme d'un seul argument:
	* > $*
* L'ensemble des arguments, un argument par paramètre:
	* >  $@
* Le nombre de paramètres passés au script:
	* > $#
* Le code retour de la dernière commande::
	* > $?
* Le PID su shell qui exécute le script:
	* > $$
* Le PID du dernier processus lancé en arrière-plan:
	* > $!


Emergency
=========

Grub
----

1. Reach the grub and chose the first line
2. Use 'e' to edit
3. Go to the "vmlinux" line to add '**rd.break'** at the end (This change is temporary)
4. Press 'CTRL+x' to exit an run it


Rescure
-------
This prompt spawn: 
> switch_root:/#.

Mount sysroot :
> mount -o remount rw [/sysroot](file:///home/sboistel/Documents/Cliford/Zbook/sysroot)

Chroot into sysroot :
> chroot [/sysroot](file:///home/sboistel/Documents/Cliford/Zbook/sysroot)

You are now able to reset root password, or edit linux things.

### Selinux
⚠ Make sure SELinux allows the file changed 
> touch [/.autorelabel](file:///home/sboistel/Documents/Cliford/Zbook/.autorelabel)
*This will signal SELinux on the next reboot that the filesystem has changed (the changed password) and allow the change to be loaded.*

Type 'exit' then 'reboot'

Network
=======

Base on APT/DEB
---------------
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

Process
=======
Lister tout les processus :

* a : Ayant un terminal de contrôle
* u : Lancés par l'/es utilisateur(s)
* x : N'ayant pas de terminal de contrôle (TTY)
* e : Tout les processe
* d : Tout les processes sauf ceux de la session courante
* l : Liste longue
* f : Full -> Avoir le nom complet du processus


CPU
---
Lister le nombre de processeur :

```bash
nproc
```

Load
====
Check the load average fixed by the system:
>  cat /proc/loadavg

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

Service
=======

Systemctl
---------
How to list enabled unit-file.

```bash
systemctl list-unit-files | grep enabled
```

Time/Date
=========

Clock
-----
How to mod sys clock ?

```bash
mv /etc/localtime /etc/localtime.backup
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime

echo "Europe/Paris" | tee /etc/timezone
timedatectl set-timezone Europe/Paris
hwclock -s
```



