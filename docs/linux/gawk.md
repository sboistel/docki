# GWAK

**Arnold Robbins**, an Atlanta native, is a professional programmer and technical author. 

He has been a heavy **AWK** user since 1987, when he became involved with **gawk**, the GNU project's version of AWK. 

## Sed

Ajout d'élèment à une ligne certaine.

```bash
sed -i '20 a nouvel élèment' FICHIER
```

### Remove saut de ligne

```bash
sed '/^$/d'
```

```bash
sed '/^:space:*$/d'
```

## AWK

Awk command :

| Command | - | Example |
| - | - | - |
| grep  | /word/  | `awk '/data/ {gsub("\"",""); print $2}'` |
| gsub | thing to remove | `awk '{gsub("\"",""); print $2}'`|

## TR

Remove space :

```bash
tr -d '[:blank:]'
```
