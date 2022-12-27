# VIM

Début ou fin de fichier :

* Go to the top : `gg`
* Go to the buttom : `G`
* Descendre à la ligne 34 : `34 G`

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
