[[_TOC_]]

---

## System
Here are somes DOS tips & tricks

### Systeminfo
Trouver la date d’installation Windows.

```POWERSHELL
systeminfo | find "installation"
```

Se rendre rapidement sur la page de gestion des software: 
Éxécuter la commande suivante (dans invite de commande ou executer ou menu démarré)

```POWERSHELL
Appwiz.cpl
```

### Kill task
How to force killing task? 

```POWERSHELL
taskkill /F /IM OpenWith.exe /T
```

### Hosts file
Hosts file configuration location :

> C:\windows\system32\drivers\etc\

### WSL
How to enable Windows Subsystem for Linux? 

```POWERSHELL
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

### How to change Drive icon ?
Open regedit as administrator :
- Go to ``Ordinateur\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\DriveIcons``
- Create a new key as the correspond lettre of your drive.
- Create a new sub key as ``Defaulticon`` :
    
```POWERSHELL
Ordinateur\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\DriveIcons\D\Defaulticon
```

Mod the chaine containned in Defaulticon key with the full path of your ``ico`` file.

### How to restore Windows 10 MBR
La démarche consiste à remplacer le MBR qui permet d'amorcer GRUB en lui substituant un MBR pointant sur le lanceur de Windows.

Le remplacement du MBR est réalisé à partir du disque de restauration Windows ou du CD d'installation.

Booter depuis le CD d'installation et choisir "Réparer ou récupérer une installation de Windows". 
On sélectionnera ensuite l'installation de Windows dans la liste des choix proposés et on saisira le mot de passe administrateur. 

Au prompt, taper :

```POWERSHELL
C:\WINDOWS> fixboot
C:\WINDOWS> fixmbr
```

La surface disque utilisée par Fedora n'est pas automatiquement ré-allouée . 
C'est l'affaire de fdsik. 

La réallocation consiste en un nouveau formatage, sous le format vfat ou ntfs ou autre, selon le choix - si l'on souhaite ré-allouer les partitions au profit de Windows. On pourra ainsi modifier le format de tout ou partie des partitions et notamment les fusionner. fdisk existe dans l'environnement Windows (ou un programme équivalent).
On redémarrera par la commande :

```POWERSHELL
C:\WINDOWS> exit
```

| Restauration Grub |
| - |
| Si les partitions Linux n'ont pas été ré-allouées, il est toujours possible de restaurer GRUB (et ainsi le boot sur Fedora ou Windows). |

## Chrome

### kiosk

Ouvrir une page web avec Google Chrome dans une page détachée: 

```POWERSHELL
Chrome.exe --app=http://
```