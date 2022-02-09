# Storage
Compressed files
================
Voici le détail des options :

* c : crée un archive.
* z : compresse l’archive avec gzip.
* v : mode verbeux, affiche la progression.
* f : permet de spécifier le nom du fichier d’archive.


Compresser
----------
Compresser des fichiers :

```bash
tar -czvf nom-de-l-archive.tar.gz /chemin/vers/répertoire-ou-fichier
```

Décompresser
------------
Pour décompresser le rar avec son passwd :

```bash
rar x -hP{MOT DE PASSE} {FICHIER.RAR}
rar x -hPTEST test2.rar
```

DD
==
dd nécessite de droits super utilisateur :

```bash
sudo dd bs=4M if=$chemin/fichier.iso of=/dev/$disk && sync
```

Memory
======

OCI :
-----
```bash
sync && echo 3 > /proc/sys/vm/drop_caches
```

RAM
---
List detailes :

```bash
ps axo rss, comm,pid,command | cat
```

LVM - Logical Volume Manager
============================

Extend partition
----------------
> fdisk [/dev/sdX](file:///home/sboistel/Documents/Cliford/Zbook/dev/sdX)
> echo 1 > /sys/block/sdX/device/rescan
> pvresize /dev/sdX2

Make FS
-------
> mkfs.xfs -d su=64k,sw=4 /dev/mapper/

Scan Disk
---------
Rescan disk
> echo 1 > /sys/class/scsi_disk/1\[:TAB:]/device/rescan

Create 1 file heavy as 1G
-------------------------
> dd if=/dev/urandom of=tempfile bs=1M count=1024

Extend volumes
--------------
```bash
lvextend -L+<<>>G /dev/mapper/VOLUME
```

Apply modifications
-------------------
```bash
resize2fs /dev/mapper/VOLUME
```

Reducing an LVM2 Swap Logical Volume
------------------------------------
Disable swapping for the associated logical volume:
> swapoff -v /dev/VolGroup00/LogVol01

Reduce the LVM2 logical volume by 512 MB:
> lvreduce /dev/VolGroup00/LogVol01 -L -512M

Format the new swap space:
> mkswap /dev/VolGroup00/LogVol01

Activate swap on the logical volume:
> swapon -v /dev/VolGroup00/LogVol01

To test if the swap logical volume was successfully reduced, inspect active swap space:
> cat /proc/swaps

