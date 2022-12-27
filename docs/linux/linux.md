# Linux

## TOC

[## smtp](smtp.md)

[## vim](vim.md)

[## network](network.md)

[## logfile](logfile.md)

[## root-rescue](root-rescue.md)

[## gawk](gawk.md)

[## desktop](desktop.md)

[## account](account.md)

[## linux](linux.md)

[## stratis](stratis.md)

[## package-manager](package-manager.md)

[## sar](sar.md)

[## memory](memory.md)

[## proc](proc.md)

[## selinux](selinux.md)

[## time](time.md)

[## screen](screen.md)

[## web](web.md)

[## disk](disk.md)

[## service](service.md)

[## apps](apps.md)

[## firewalld](firewalld.md)

[## regular-expressions](regular-expressions.md)

[## cron](cron.md)

[## where](where.md)

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