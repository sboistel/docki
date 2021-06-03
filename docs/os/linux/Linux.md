# Linux
Here are somes linux/unix tips & tricks

## RPM

###  Packages

How to force installation without depedency.

```bash
rpm -Uvh --nodeps $(repoquery --location centreon-plugins)
```

## APT

### bpytop

How to isntall bpytop :

```bash
apt install python3-pip
pip3 install psutil
pip3 install bpytop
```

## SYSTEM

## CPU

Lister le nombre de processeur :

```bash
nproc
```

### Processus

Comment utiliser ps ?

Lister tout les processus :
- a : Ayant un terminal de contrôle
- u : Lancés par l'/es utilisateur(s)
- x : N'ayant pas de terminal de contrôle (TTY)
- e : Tout les processe
- d : Tout les processes sauf ceux de la session courante
- f : Full format

```bash
ps aux
```

Liste de paramètres :
- l : Liste longue
- f : Full -> Avoir le nom complet du processus

### Sar

On trouvera les fichier de log de l'outil **sysstat** dans : ``/var/log/sysstat/``
Chacun des fichier dans ce dossier sera normé par ``sa$JOUR_DU_MOIS``.

Liste des paramètres :
- S : swap
- r : RAM
- R : Caches
- u : Utilisateur

## Lvm

Extend volumes.

```bash
lvextend -L+<<>>G /dev/mapper/VOLUME
```

Apply modifications. 

```bash
resize2fs /dev/mapper/VOLUME
```

## Swap

Desativation :

```bash
swapoff -v /dev/mapper/volume
```

Re-formater le volume swap :

```bash
mkswap /dev/mapper/volume
```

Activate logical volume ;

```bash
swapon -va
```

## RAM

List detailes.

```bash
ps axo rss, comm,pid,command | cat
```

On OCI :
> sync && echo 3 > /proc/sys/vm/drop_caches

## Systemctl
How to list enabled unit-file.
> systemctl list-unit-files | grep enabled

## Load
Check the load average fixed by the system:
> cat /proc/loadavg

Verify time since the system is up:
> uptime

You could check your system processes by top/htop or glances and more one else:
> top

You can folow your CPU in real time by this command:
> vmstat -w 1

## Logrotate
Check :
> logrotate -d /etc/logrotate.d/httpd

Apply :
> logrotate -vf /etc/logrotate.d/httpd

## Analyse

Check last user connection :
> last -15 -aFw

For DEB packages only :
> cat /var/log/auth.log

# Network
## iP Adress
Public iP :
> curl ifconfig.me 

or

> curl ifconfig.co

Private iP :
> hostname -i

### APT :

File : /etc/network/interfaces :

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

## Blank Screen
Retirer la mise en veille lors de la fermeture du capot de l’ordinateur portable.

```bash
   setterm-powersave off -blank 0
   systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

## Sudoers
Autorisation de l’utilisateur max de supprimer dans le dossier. 
> max ALL=NOPASSWD:/bin/rm -rf $CHEMIN_de_DOSSIER/*
 
Autorisation pour l’utilisateur matry_mc_fly de lire les fichiers dans le dossier.
> marty_mc_fly ALL=NOPASSWD:/usr/bin/cat /var/log/mariadb/*

## Clock
How to mod sys clock ?

```bash
   mv /etc/localtime /etc/localtime.backup
   ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime

   echo "Europe/Paris" | tee /etc/timezone
   timedatectl set-timezone Europe/Paris
   hwclock -s
```

## Command
### Back Commande
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

## Grep
L'outil « grep », qui signifie « impression d’expressions régulières globales », traite le texte ligne par ligne et imprime toutes les lignes correspondant au modèle spécifié.

```bash
grep infos fichiers.txt
grep -A $NUMBER_OF_LINE "INFOS QU'ON CHERCHE" -B $NUMBER_OF_LINE
```

## Sed & TR
Remove saut de ligne.
> sed '/^$/d'

or 

> sed '/^[[:space:]]*$/d'

Dans vim : `:%s /foo/newfoo/g`

Ajout d'élèment à une ligne certaine.
> sed -i '20 a nouvel élèment' FICHIER

Remove space.
> tr -d '[:blank:]'

## AWK
Awk command :

- "grp" /word/ :
   > awk '/data/ {gsub("\"",""); print $2}'

- "gsub" thing to remove:
   > awk '{gsub("\"",""); print $2}'

## VIM
Flêches directionnelles :
- j -> descendre
- k -> monter
- l -> droite
- h -> droite

Début ou fin de fichier :
- Go to the top :
   > gg
- Go to the buttom :
   > G
- Descendre à la ligne 34 :
   > 34 G
Début ou fin de ligne :
- Fin de la ligne où se trouve le dernier carractère :
   > $ 
- Début de la ligne où se trouve le premier carractère :
   > 0 (shift+à)
Supprimer les dernières actions "CRTL+Z" :
- Undo :
   > u

Keymap utils :

- Début du mot | si '/||.||--||...' alors utiliser B :
   > b
- Début du dexième mot en partant du mot d'origin :
   > 3B
- Fin du mot suivant :
   > e
- Mot suivant :
   > w
- Replace :
   > r
- Supprimer carractère par carractère :
   > x
- Supprimer à reculon carractère par carractère :
   > x
- Changer (ce -> changer jusqu'à la fin du mot ) :
    > c
- Enregister les modifications :
    > ZZ
- Enregistrer les modifications et quiter le fichier :
   > ZQ

Répeter la dernière actions effectuée : 
> .

Faire du sed : ``:%s /foo/newfoo/g``

Faire une recherche :
- Du ahut vers le bas :
  > /
- Du bas vers le haut :
  > ?
- Mot sur lequel je suis :
  > *

Retirer le surlignage : ``:noh``

## Compressed files

Compresser des fichiers :

> tar -czvf nom-de-l-archive.tar.gz /chemin/vers/répertoire-ou-fichier


Voici le détail des options :
- c : crée un archive.
- z : compresse l’archive avec gzip.
- v : mode verbeux, affiche la progression.
- f : permet de spécifier le nom du fichier d’archive.

Pour décompresser le rar avec son passwd :

```bash
rar x -hP{MOT DE PASSE} {FICHIER.RAR}
rar x -hPTEST test2.rar
```

## lamp

Apache check config :

```bash
/opt/lampp/bin/httpd -t
```

Apache restart :

```bash
/opt/lampp/bin/httpd -k restart
```

###  PEM Key

Create pem key :

```bash
Puttygen mykey.ppk -O private-openssh -o mykey.pem
```

## Mail

Basic postfix configuration ``/etc/postfix/main.cf`` :

```bash
relayhost = [smtp.gmail.com]:587
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
```

## Useradd

How to adding user ?

```bash
useradd -s /sbin/nologin -G $GRP
useradd -m -G wheel -s /bin/bash $account
```

###  DD

dd nécessite de droits super utilisateur :

```bash
sudo dd bs=4M if=$chemin/fichier.iso of=/dev/$disk && sync
```

## Find

Trouver tout fichier depuis l’endroit que vous souhaitez portant le nom de jacquet :

```bash
find $DEPUIS_QUEL_ENDROIT -name "jacquet"
```

Trouver dans le dossier httpd tout fichier plus vieux de 90 jours puis les supprimer :

```bash
find /var/log/httpd/ -type f -name "*" -mtime +90 -exec rm -f {} \;
```

| Note |
|-|
| Le « {} » est le résultat de la recherche du find ! |