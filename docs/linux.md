# Linux

## System

### Exit codes

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


### Emergency

#### Grub

1. Reach the grub and chose the first line
2. Use 'e' to edit
3. Go to the "vmlinux" line to add '**rd.break'** at the end (This change is temporary)
4. Press 'CTRL+x' to exit an run it


#### Rescure
This prompt spawn:
> switch_root:/#.

Mount sysroot :
> mount -o remount rw sysroot

Chroot into sysroot :
> chroot sysroot

You are now able to reset root password, or edit linux things.

#### Selinux
⚠ Make sure SELinux allows the file changed 
> touch .autorelabel
*This will signal SELinux on the next reboot that the filesystem has changed (the changed password) and allow the change to be loaded.*

Type 'exit' then 'reboot'

### Network

#### Base on APT/DEB
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

### Process
Lister tout les processus :

* a : Ayant un terminal de contrôle
* u : Lancés par l'/es utilisateur(s)
* x : N'ayant pas de terminal de contrôle (TTY)
* e : Tout les processe
* d : Tout les processes sauf ceux de la session courante
* l : Liste longue
* f : Full -> Avoir le nom complet du processus


### CPU
Lister le nombre de processeur :

```bash
nproc
```

#### Load
Check the load average fixed by the system:
> cat /proc/loadavg

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

### Service

#### Systemctl
How to list enabled unit-file.

```bash
systemctl list-unit-files | grep enabled
```

### Time/Date

#### Clock
How to mod sys clock ?

```bash
mv /etc/localtime /etc/localtime.backup
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime

echo "Europe/Paris" | tee /etc/timezone
timedatectl set-timezone Europe/Paris
hwclock -s
```

## Account
Created Tuesday 25 January 2022

List account :
```bash
find /home -maxdepth 1 -type d -group users | cut -d '/' -f3
```

### Useradd
How to adding user ?

```bash
useradd -s /sbin/nologin -G $GRP
useradd -m -G wheel -s /bin/bash $account
```

#### Lock / Unlock
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

### Sudoers
Autorisation de l’utilisateur max de supprimer dans le dossier. 

```bash
max ALL=NOPASSWD:/bin/rm -rf $CHEMIN_de_DOSSIER/*
```

Autorisation pour l’utilisateur matry_mc_fly de lire les fichiers dans le dossier.

```bash
marty_mc_fly ALL=NOPASSWD:/usr/bin/cat /var/log/mariadb/*
```

## Key

### PEM Key
Create pem key :

```bash
Puttygen mykey.ppk -O private-openssh -o mykey.pem
```

## Applications
Created Wednesday 26 January 2022

### Screen

#### Touchscreen
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

#### Blank Screen

Retirer la mise en veille lors de la fermeture du capot de l’ordinateur portable.

```bash
   setterm-powersave off -blank 0
   systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

### lamp
Apache check config :

```bash
/opt/lampp/bin/httpd -t
```

Apache restart :

```bash
/opt/lampp/bin/httpd -k restart
```

### Postfix
Basic postfix configuration `/etc/postfix/main.cf` :

```bash
relayhost = [smtp.gmail.com]:587
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
```

### Logrotate

#### Check

```bash
logrotate -d /etc/logrotate.d/httpd
```

#### Apply
```bash
logrotate -vf /etc/logrotate.d/httpd
```

## Tools & Packages

### RPM

How to force installation without depedency.

```bash
rpm -Uvh 
```

### Debian

#### Repository

bullseye 11 sources.list

```bash
deb http://deb.debian.org/debian bullseye main
deb-src http://deb.debian.org/debian bullseye main

deb http://deb.debian.org/debian-security/ bullseye-security main
deb-src http://deb.debian.org/debian-security/ bullseye-security main

deb http://deb.debian.org/debian bullseye-updates main
deb-src http://deb.debian.org/debian bullseye-updates main
```

#### bpytop

How to isntall bpytop based on APT :

```bash
apt install python3-pip
pip3 install psutil
pip3 install bpytop
```

### VIM

Début ou fin de fichier :

* Go to the top : `gg`
* Go to the buttom : `G`
* Descendre à la ligne 34 : `34 G`


Début ou fin de ligne :

* Fin de la ligne où se trouve le dernier carractère : `$` 
* Début de la ligne où se trouve le premier carractère : `0` *(shift+à)*


### Keymap

Liste:

- Début du mot : `b`
- Début du dexième mot en partant du mot d'origin : `3B`
- Fin du mot suivant : `e`
- Mot suivant : `w`
- Replace : `r`
- Supprimer carractère par carractère : `x`
- Supprimer à reculon carractère par carractère : `c`
- Changer (ce -> changer jusqu'à la fin du mot ) : `c`
- Enregister les modifications : `ZZ`
- Enregistrer les modifications et quiter le fichier : `ZQ`

Répeter la dernière actions effectuée : `.`

### Sed

Faire du sed : ``:%s /foo/newfoo/g``

### Highlithing

Retirer le surlignage : ``:noh``

### Grep

L'outil « grep », qui signifie « impression d’expressions régulières globales », traite le texte ligne par ligne et imprime toutes les lignes correspondant au modèle spécifié.

```bash
grep infos fichiers.txt
grep -A $NUMBER_OF_LINE "INFOS QU'ON CHERCHE" -B $NUMBER_OF_LINE
```

### Sed

Ajout d'élèment à une ligne certaine.
```bash
sed -i '20 a nouvel élèment' FICHIER
```

#### Remove saut de ligne.

```bash
sed '/^$/d'
```

```bash
sed '/^:space:*$/d'
```

### VIM

Dans vim : `:%s /foo/newfoo/g`

### TR

Remove space :

```bash
tr -d '[:blank:]'
```

### AWK

Awk command :

* `grep` /word/ :
* awk '/data/ {gsub("\"",""); print $2}'


* `gsub` thing to remove:
* awk '{gsub("\"",""); print $2}'


### Find

Trouver tout fichier depuis l’endroit que vous souhaitez portant le nom de jacquet :

```bash
find $DEPUIS_QUEL_ENDROIT -name "jacquet"
```

Trouver dans le dossier httpd tout fichier plus vieux de 90 jours puis les supprimer :

```bash
find /var/log/httpd/ -type f -name "*" -mtime +90 -exec rm -f {} \;
```


| Note                                                |
| - |
| Le « {} » est le résultat de la recherche du find ! |

## Storage

### Compressed files
Voici le détail des options :

* c : crée un archive.
* z : compresse l’archive avec gzip.
* v : mode verbeux, affiche la progression.
* f : permet de spécifier le nom du fichier d’archive.


#### Compresser
Compresser des fichiers :

```bash
tar -czvf nom-de-l-archive.tar.gz /chemin/vers/répertoire-ou-fichier
```

#### Décompresser
Pour décompresser le rar avec son passwd :

```bash
rar x -hP{MOT DE PASSE} {FICHIER.RAR}
rar x -hPTEST test2.rar
```

### DD
dd nécessite de droits super utilisateur :

```bash
sudo dd bs=4M if=$chemin/fichier.iso of=/dev/$disk && sync
```

### Memory

#### Oracle cloud infrastructure
```bash
sync && echo 3 > /proc/sys/vm/drop_caches
```

#### RAM
List detailes :

```bash
ps axo rss, comm,pid,command | cat
```

### LVM - Logical Volume Manager

#### Extend partition
```bash
fdisk [/dev/sdX](file:///home/sboistel/Documents/Cliford/Zbook/dev/sdX)
```

```bash
echo 1 > /sys/block/sdX/device/rescan
```

```bash
pvresize /dev/sdX2
```


#### Make FS
```bash
mkfs.xfs -d su=64k,sw=4 /dev/mapper/
```

#### Scan Disk
Rescan disk
```bash
echo 1 > /sys/class/scsi_disk/1\[:TAB:]/device/rescan
```

#### Create 1 file heavy as 1G
```bash
dd if=/dev/urandom of=tempfile bs=1M count=1024
```

#### Extend volumes
```bash
lvextend -L+<<>>G /dev/mapper/VOLUME
```

#### Apply modifications
```bash
resize2fs /dev/mapper/VOLUME
```

#### Reducing an LVM2 Swap Logical Volume
Disable swapping for the associated logical volume:
```bash
swapoff -v /dev/VolGroup00/LogVol01
```

Reduce the LVM2 logical volume by 512 MB:
```bash
lvreduce /dev/VolGroup00/LogVol01 -L -512M
```

Format the new swap space:
```bash
mkswap /dev/VolGroup00/LogVol01
```

Activate swap on the logical volume:
```bash
swapon -v /dev/VolGroup00/LogVol01
```

To test if the swap logical volume was successfully reduced, inspect active swap space:
```bash
cat /proc/swaps
```

## Analyse
### SAR
On trouvera les fichier de log de l'outil **sysstat** dans : ``/var/log/sysstat/``
Chacun des fichier dans ce dossier sera normé par ``sa$JOUR_DU_MOIS``.

Liste des paramètres :

* S : swap
* r : RAM
* R : Caches
* u : Utilisateur


### Connection

#### User
Check last user connection :

```bash
last -15 -aFw
```

For DEB packages only :

```bash
cat /var/log/auth.log
```

## Desktop Environement
Here are somes Desktop Environement tips & tricks

### Gnome

#### Ajouter une application dans gnom shell
Ajouter un fichier .desktop dans /usr/share/appliations/MONAPPLI.desktop :

```bash
[Desktop Entry]
Name=MonAppli
Comment=Descritpion de l'appli
Exec=MonAppli.sh %U
Icon=/usr/share/icons/monappli.svg
Terminal=false
Type=Application
Encoding=UTF-8
Categories=Network;Application
```

#### Modifier une application éxistante
Trouver le fichier de l'application choisie, ici `VirtualBox`
Un soucis connu sur Gnome et virtualbox est que l'interface soit broken. On vient alors corrigé ceci en  changeant le style de celui-ci via la commande :

```bash
VirtualBox -style Adwaita
```

On vient alors modifier le fichier `/usr/share/applications/virtualbox.desktop`
On remplace la ligne 10 `Exec=VirtualBox %U` par `Exec=VirtualBox -style Adwaita`.

### Desktop Manager

#### Lightdm

##### Autologin
Editer le fichier de configuration suivant : ``/etc/lightdm/lightdm.conf``
Compléter les informations attendues :

```BASH
autologin-user=jdoe
```