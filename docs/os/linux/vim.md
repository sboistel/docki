# VIM

# Navigation

## VI
Flêches directionnelles :
- j -> descendre
- k -> monter
- l -> droite
- h -> droite

## VIM
Début ou fin de fichier :
- Go to the top :
   > gg
- Go to the buttom :
   > G
- Descendre à la ligne 34 :
   > 34 G
Début ou fin de ligne :
- Fin de la ligne où se trouve le dernier carractère :
   > $ 
- Début de la ligne où se trouve le premier carractère :
   > 0 (shift+à)
Supprimer les dernières actions "CRTL+Z" :
- Undo :
   > u

## Keymap 

Liste :

- Début du mot | si '/||.||--||...' alors utiliser B :
   > b
- Début du dexième mot en partant du mot d'origin :
   > 3B
- Fin du mot suivant :
   > e
- Mot suivant :
   > w
- Replace :
   > r
- Supprimer carractère par carractère :
   > x
- Supprimer à reculon carractère par carractère :
   > x
- Changer (ce -> changer jusqu'à la fin du mot ) :
    > c
- Enregister les modifications :
    > ZZ
- Enregistrer les modifications et quiter le fichier :
   > ZQ

Répeter la dernière actions effectuée : 
> .

## Sed
Faire du sed : ``:%s /foo/newfoo/g``

# Search

Faire une recherche :
- Du ahut vers le bas :
  > /
- Du bas vers le haut :
  > ?
- Mot sur lequel je suis :
  > *

# Highlithing
Retirer le surlignage : ``:noh``