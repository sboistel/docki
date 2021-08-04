# Regular parsing

* [Regular parsing](#regular-parsing)  
  * [Grep](#grep)  
  * [Sed &amp; TR](#sed--tr)  
  * [AWK](#awk)  
  * [Find](#find)

## Grep

'outil « grep », qui signifie « impression d’expressions régulières globales », traite le texte ligne par ligne et imprime toutes les lignes correspondant au modèle spécifié.

```bash
grep infos fichiers.txt
grep -A $NUMBER_OF_LINE "INFOS QU'ON CHERCHE" -B $NUMBER_OF_LINE
```

## Sed & TR
Remove saut de ligne.
```bash
sed '/^$/d'
```
or 

```bash
sed '/^[[:space:]]*$/d'
```

Dans vim : `:%s /foo/newfoo/g`

Ajout d'élèment à une ligne certaine.
> sed -i '20 a nouvel élèment' FICHIER

Remove space.
> tr -d '[:blank:]'

## AWK
Awk command :

- "grp" /word/ :
   > awk '/data/ {gsub("\"",""); print $2}'

- "gsub" thing to remove:
   > awk '{gsub("\"",""); print $2}'

## Find

Trouver tout fichier depuis l’endroit que vous souhaitez portant le nom de jacquet :

```bash
find $DEPUIS_QUEL_ENDROIT -name "jacquet"
```

Trouver dans le dossier httpd tout fichier plus vieux de 90 jours puis les supprimer :

```bash
find /var/log/httpd/ -type f -name "*" -mtime +90 -exec rm -f {} \;
```

| Note |
|-|
| Le « {} » est le résultat de la recherche du find ! |