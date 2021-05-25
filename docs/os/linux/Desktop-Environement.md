[[_TOC_]]

---
 
Here are somes Desktop Environement tips & tricks

## Gnome

Ajouter une application dans gnom shell.

Ajouter un fichier .desktop dans /usr/share/appliations/MONAPPLI.desktop :

```BASH
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

## Desktop Manager

### Lightdm

#### Autologin

Editer le fichier de configuration suivant : ``/etc/lightdm/lightdm.conf``

Compléter les informations attendues :

```BASH
autologin-user=sboistel
```