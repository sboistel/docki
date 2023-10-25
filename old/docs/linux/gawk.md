# GWAK

**Arnold Robbins**, an Atlanta native, is a professional programmer and technical author. 

He has been a heavy **AWK** user since 1987, when he became involved with **gawk**, the GNU project's version of AWK. 

## Sed

Add item to certain line

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

## FIND

### Files

Find all 'jacquet' file from $PLACE :

```bash
find $PLACE -name "jacquet"
```

### Directory

Find all files older than 90 days in `/var/log/httpd/` directory

```bash
find /var/log/httpd/ -type f -name "*" -mtime +90 -exec rm -f {} \;
```

#### Exclude

How to exclude directory.ies ?

Use the `! -path '*$THING*'`syntax

```shell
find $PLACE -type f -name $SOMETING ! -path '*NOT_THIS_ONE*'
```

!!! note

    `{}` is the resutl of find command

## Grep

That is a command-line utility for searching plain-text data sets for lines that match a regular expression.

Its name comes from the `ed` command `g/re/p` (*globally search for a regular expression and print matching lines*).

```bash
grep thing file.txt
grep "searching elements" -A $NUMBER_OF_LINE -B $NUMBER_OF_LINE
```

Catch something from multiple files

```shell
grep -ari copyright /var/www/html/
```
