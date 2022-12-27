# Linux

## TOC

[## smtp.md](smtp.md)

[## vim.md](vim.md)

[## network.md](network.md)

[## logfile.md](logfile.md)

[## root-rescue.md](root-rescue.md)

[## gawk.md](gawk.md)

[## desktop.md](desktop.md)

[## account.md](account.md)

[## linux.md](linux.md)

[## stratis.md](stratis.md)

[## package-manager.md](package-manager.md)

[## sar.md](sar.md)

[## memory.md](memory.md)

[## proc.md](proc.md)

[## selinux.md](selinux.md)

[## time.md](time.md)

[## screen.md](screen.md)

[## web.md](web.md)

[## disk.md](disk.md)

[## service.md](service.md)

[## apps.md](apps.md)

[## firewalld.md](firewalld.md)

[## regular-expressions.md](regular-expressions.md)

[## cron.md](cron.md)

[## where.md](where.md)

## Exit codes

* Contient le nom du script tel qu'il a été invoqué:
   > $0
* L'ensembles des paramètres sous la forme d'un seul argument:
  > $*
* L'ensemble des arguments, un argument par paramètre:
  >  $@
* Le nombre de paramètres passés au script:
  > $#
* Le code retour de la dernière commande:
  > $?
* Le PID su shell qui exécute le script:
  > `$$`
* Le PID du dernier processus lancé en arrière-plan:
  > `$!`

## Keymap

Liste:

* Début du mot : `b`
* Début du dexième mot en partant du mot d'origin : `3B`
* Fin du mot suivant : `e`
* Mot suivant : `w`
* Replace : `r`
* Supprimer carractère par carractère : `x`
* Supprimer à reculon carractère par carractère : `c`
* Changer (ce -> changer jusqu'à la fin du mot ) : `c`
* Enregister les modifications : `ZZ`
* Enregistrer les modifications et quiter le fichier : `ZQ`

Répeter la dernière actions effectuée : `.`