# Touchscreen

How to disable touchscreen at start ?

Create a new file as `/etc/X11/xorg.conf.d/01-no_touchscreen.conf` as 664 :

```bash
## Written by systemd-localed(8), read by systemd-localed and Xorg. Its
## probably wise not to edit this file manually. use localectl(1) to
## instruct systemd-localed to update it
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

## Blank Screen

logind est le composant en charge de la gestion des sessions sur les systèmes avec systemd.

Il détermine le comportement d’un ordinateur portable lorsque l’on ferme l’écran (Lid Switch) via la variable `HandleLidSwitch` de son fichier de configuration :  `/etc/systemd/logind.conf` .

Sa valeur par défaut est suspend (mise en veille).

Les valeurs acceptées pour la variable HandleLidSwitch:

* ignore (ne fait rien)
* poweroff (arrêt)
* reboot (redémarrage)
* halt (arrêt)
* kexec
* suspend (veille, le comportement par défaut)
* hibernate (hibernation)
* hybrid-sleep (hibernation avec conservation des données en mémoire)
* lock (Verrouille de la session)

Donc si je souhaite que mon portable reste actif lorsque l’écran est fermé:

> vim  /etc/systemd/logind.conf

Puis on modifie le paramètre HandleLidSwitch de cette façon:

> #HandleLidSwitch=suspend

devient

> HandleLidSwitch=ignore

Et on termine par un petit redémarrage:

> reboot

Retirer la mise en veille lors de la fermeture du capot de l’ordinateur portable.

```bash
setterm-powersave off -blank 0
systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```
