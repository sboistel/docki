# Linux

## TOC

* account.md
* apps.md
* cron.md
* desktop.md
* disk.md
* firewalld.md
* gawk.md
* linux.md
* logfile.md
* memory.md
* network.md
* package-manager.md
* proc.md
* regular-expressions.md
* root-rescue.md
* sar.md
* screen.md
* selinux.md
* service.md
* smtp.md
* stratis.md
* time.md
* vim.md
* web.md
* where.md

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