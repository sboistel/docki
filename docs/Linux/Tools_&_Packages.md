# Tools & Packages
RPM
===
How to force installation without depedency.

```bash
rpm -Uvh --nodeps $(repoquery --location centreon-plugins)
```

bpytop
======
How to isntall bpytop based on APT :

```bash
apt install python3-pip
pip3 install psutil
pip3 install bpytop
```

VIM
===
Début ou fin de fichier :

* Go to the top :
	* > gg
* Go to the buttom :
	* > G
* Descendre à la ligne 34 :
	* > 34 G


Début ou fin de ligne :

* Fin de la ligne où se trouve le dernier carractère :
	* > $ 
* Début de la ligne où se trouve le premier carractère :
	* > 0 (shift+à)


Keymap
======
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

Sed
===
Faire du sed : ``:%s /foo/newfoo/g``

Highlithing
===========
Retirer le surlignage : ``:noh``

Grep
====
L'outil « grep », qui signifie « impression d’expressions régulières globales », traite le texte ligne par ligne et imprime toutes les lignes correspondant au modèle spécifié.

```bash
grep infos fichiers.txt
grep -A $NUMBER_OF_LINE "INFOS QU'ON CHERCHE" -B $NUMBER_OF_LINE
```

Sed
===
Ajout d'élèment à une ligne certaine.
> sed -i '20 a nouvel élèment' FICHIER

Remove saut de ligne.
---------------------
```bash
sed '/^$/d'
```

```bash
sed '/^:space:*$/d'
```

VIM
---
Dans vim : `:%s /foo/newfoo/g`

TR
==
Remove space.
> tr -d '[:blank:]'

AWK
===
Awk command :


* "grp" /word/ :
* awk '/data/ {gsub("\"",""); print $2}'



* "gsub" thing to remove:
* awk '{gsub("\"",""); print $2}'


Find
====
Trouver tout fichier depuis l’endroit que vous souhaitez portant le nom de jacquet :

```bash
find $DEPUIS_QUEL_ENDROIT -name "jacquet"
```

Trouver dans le dossier httpd tout fichier plus vieux de 90 jours puis les supprimer :

```bash
find /var/log/httpd/ -type f -name "*" -mtime +90 -exec rm -f {} \;
```

| Note                                                |
|-----------------------------------------------------|
| Le « {} » est le résultat de la recherche du find ! |

