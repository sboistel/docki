# Linux

## TOC

* [## account](account.md)
* [## apps](apps.md)
* [## cron](cron.md)
* [## desktop](desktop.md)
* [## disk](disk.md)
* [## firewalld](firewalld.md)
* [## gawk](gawk.md)
* [## logfile](logfile.md)
* [## memory](memory.md)
* [## network](network.md)
* [## package-manager](package-manager.md)
* [## proc](proc.md)
* [## regular-expressions](regular-expressions.md)
* [## root-rescue](root-rescue.md)
* [## sar](sar.md)
* [## screen](screen.md)
* [## selinux](selinux.md)
* [## service](service.md)
* [## smtp](smtp.md)
* [## stratis](stratis.md)
* [## time](time.md)
* [## vim](vim.md)
* [## web](web.md)
* [## where](where.md)

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