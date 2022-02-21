# Python
Python tips & tricks

## Virtual Env

Also known as `venv`

A virtual environement ne require to have any permission (**rootless ..**)

### How to ?

- Create python working directory :

```sh
mkdir py
```

- Create python venv (here name `pyvenv`)

```sh
cd py
python3 -m venv pyvenv
```

- Download module

```sh
mkdir module; cd module
pip download module_name
```

- Install virtual environement 

You have to fill the module name you donwloaded to the `py/requierements.txt` file 

Go back to py directory,

```sh
echo "module_name" >> requirements.txt
source pyvenv/bin/active
pip install --no-index --find-links module/ -r requirements.txt
```

## Syntaxe

### Coding

Format UTF-8 : ``## -*- coding:Utf-8 -*-``

## Librairy

### Import de librairie

On peut importer un seul module d'une librairie :

```python
from LIBRAIRIE import module
```

On peut aussi importer la librairie complette : 

```python
from LIBRAIRIE import *
```

Ou depuis un autre fichier.Py :

```python
from fichier import classe
```

## Interpollation

Divers techniques existe afin de sortir un clef d'une liste:

```python
print("Je m'appel %s !" % liste_nom['nom']) 
print("Je m'appel %(nom)s !" % d)
print("Je m'appel {0} !".format(d['nom']))
```

### Vérifications

Vérifier si un block est correct avec 'try' :

```python
try: ## Vérifier ce bloc
file = open('infos.txt', 'r')
print(file.read())
except: ## Si erreur se trouve dans try
print("erreur")
finally: ## Qui s'éxecutera quoi qu'il arrive des blocs précédents
file.close
```

La vérification peut se traduire par plusieur méthodes :

```python
execpt IOError ## Pour se qui concerne les fichier ou élèments en dur
except ValueError ## Qui concernera les érreurs de conversions
```
La méthode la plus sûr reste l'option 'with':

```python
try: ## Vérifier ce bloc
with open('infox.txt', 'r') as file: ## Avec le fichier, l'ouvrir en var file
for line in file.readlines():
print(int(line.strip()))
except IOError as err:
print("Erreur de fichier", err)
except ValueError:
print("Erreur de conversion")
except:
print("Erreur inconnue, tous aux abris.")
else:
print("Fichier connue de tous wallah")
```

## TKinter

TKinter est une librairie permettant de génerer des fenêtre sur le code Python.
Exemple de code :

```python
from Tkinter import *
fenetre = Tk()
label = Label(fenetre, text="Exmple de coprs de fenêtre")
label.pack()
fenetre.mainloop()
```

### Personnalisation de la fenêtre

Liste d'élèments permettant de personnaliser une fenêtre (ici : *window = Tk()*):
- window.title("**My application**")
- window.geometry("720x480")
- window.minsize(700, 300)
- window.iconbitmap("image.ico")
- window.config(background='#CC0000')

### Widget

#### Case à cocher
Liste de case à cocher :

```python
caseACocher1 = Checkbutton(window, text="Case N°1").pack()
caseACocher2 = Checkbutton(window, text="Case N°2").pack()
...
```

#### Champs de saisie
Champs de saisie :

```python
value = StringVar()
value.set("Zonne de text")
entree = Entry(window, textvariable=value, width=30)
entree.pack()
```

#### Barre de menu

Menu fichier :

```python
file_menu = Menu(menu_bar, tearoff=0)
file_menu.add_command(label="Nouveau", command=generate_password)
file_menu.add_command(label="Quitter", command=window.quit)
menu_bar.add_cascade(label="Fichier", menu=file_menu)
```