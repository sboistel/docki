# Account
Created Tuesday 25 January 2022

List account :
 > find /home -maxdepth 1 -type d -group users | cut -d '/' -f3

Useradd
=======
How to adding user ?

```bash
useradd -s /sbin/nologin -G $GRP
useradd -m -G wheel -s /bin/bash $account
```

Lock / Unlock
-------------
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

Time life password
------------------

Show the account password information
```bash
chage -l $USER
```

Set minimum day
```bash
chage -m ${NOMBER OF DAY} ${USER}
```

Sudoers
=======
Autorisation de l’utilisateur max de supprimer dans le dossier. 

```bash
max ALL=NOPASSWD:/bin/rm -rf $CHEMIN_de_DOSSIER/*
```

Autorisation pour l’utilisateur matry_mc_fly de lire les fichiers dans le dossier.

```bash
marty_mc_fly ALL=NOPASSWD:/usr/bin/cat /var/log/mariadb/*
```

Key
===

PEM Key
-------
Create pem key :

```bash
Puttygen mykey.ppk -O private-openssh -o mykey.pem
```

