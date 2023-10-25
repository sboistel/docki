# VIM

Début ou fin de fichier :

* Go to the top : `gg`
* Go to the buttom : `G`
* Descendre à la ligne 34 : `34 G`
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

Début ou fin de ligne :

* Fin de la ligne où se trouve le dernier carractère : `$`
* Début de la ligne où se trouve le premier carractère : `0` *(shift+à)*

Dans vim : `:%s /foo/newfoo/g`

## Tooling

### Sed

Faire du sed dans vim

```shell
:%s /foo/newfoo/g`
```

### Highlithing Word

Retirer le surlignage :

```shell
:noh
```
