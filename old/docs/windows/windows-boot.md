# Windows Boot

## How to restore Windows 10 MBR

La démarche consiste à remplacer le MBR qui permet d'amorcer GRUB en lui substituant un MBR pointant sur le lanceur de Windows.

Le remplacement du MBR est réalisé à partir du disque de restauration Windows ou du CD d'installation.

Booter depuis le CD d'installation et choisir "Réparer ou récupérer une installation de Windows".
On sélectionnera ensuite l'installation de Windows dans la liste des choix proposés et on saisira le mot de passe administrateur.

Au prompt, taper :

```powershell
C:\WINDOWS> fixboot
C:\WINDOWS> fixmbr
```

La surface disque utilisée par Fedora n'est pas automatiquement ré-allouée .
C'est l'affaire de fdsik.

La réallocation consiste en un nouveau formatage, sous le format vfat ou ntfs ou autre, selon le choix - si l'on souhaite ré-allouer les partitions au profit de Windows. On pourra ainsi modifier le format de tout ou partie des partitions et notamment les fusionner. fdisk existe dans l'environnement Windows (ou un programme équivalent).
On redémarrera par la commande :

```powershell
C:\WINDOWS> exit
```

!!! abstract "Restauration Grub"
    Si les partitions Linux n'ont pas été ré-allouées, il est toujours possible de restaurer GRUB (et ainsi le boot sur Fedora ou Windows)
