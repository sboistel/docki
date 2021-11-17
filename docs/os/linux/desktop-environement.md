# Desktop environnement
 
Here are somes Desktop Environement tips & tricks

## Gnome

### Ajouter une application dans gnom shell

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

### Modifier une application éxistante

Trouver le fichier de l'application choisie, ici `VirtualBox`

Un soucis connu sur Gnome et virtualbox est que l'interface soit broken. On vient alors corrigé ceci en  changeant le style de celui-ci via la commande :

> VirtualBox -style Adwaita

On vient alors modifier le fichier `/usr/share/applications/virtualbox.desktop`

On remplace la ligne 10 `Exec=VirtualBox %U` par `Exec=VirtualBox -style Adwaita`.


## Desktop Manager

### Lightdm

#### Autologin

Editer le fichier de configuration suivant : ``/etc/lightdm/lightdm.conf``

Compléter les informations attendues :

```BASH
autologin-user=sboistel
```