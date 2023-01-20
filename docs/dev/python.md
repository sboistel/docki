# Python
Python tips & tricks

## Conparators

| Operator | Description |
| :-: | :- |
| == | Equal to |
| > | Greater then |
| >= | Greter than **or** equal |
| < | Less then |
| <= | Less then **or** equal |
| != | Not equal |

!!! example "Example code"

	```python
	#!/usr/bin/env python3
	
	age = 99
	
	if age <= 35:
	    print('You are old enough to be a Representative, Senator, or the President.')
	elif age >= 30:
	    print('You are old enough to be a Senator.')
	elif age >= 25:
	    print('You are old enough to be a Representative.')
	else:
	    print('You are not old enough to be a Representativen Senator or the President.')
	
	print('Have a nice day!')
	```

!!! faq "Output"

	```python
	You are old enough to be a Senator.
	Have a nice day!
	```

## Boolean Operators

| Operator | Description |
| :-: | :- |
| and | Evalutates to **True** if both statements are true, otherwiser evaluates to **False**. |
| or | Evaluates to **True** if either of the statements is true, otherwise evaluates to **False**. |
| not | Evaluates to the opposite of the statement. |

### Numbers

How to work betwen numbers variables ?

For example, we gona talking about `age`

```python
age = 18
```

So tu use age into operators, you have to format the `age` var using `int`

```python
int(age)
```

!!! tip "Python Tips"

	If you need to use the age var along your script convert this var to an **interger**

	```python
	age = 18 # or age = input('Tell me your age please? ')
	age = int(age)
	```

## Functions

1. Don't Repeat Yourselft
2. Write one tim, use many times

!!! example "Function code block example"

	```python
	def function_name():
		# code block
	```
as

```python
def say_hi():
	print('Hi!')
```

To run any function, just have to call it like :

```python
def say_hi():
	print('Hi!')

say_hi() # < run the function say_hi
```

!!! warning
	Keep inmind that any function must be **defined** before to be next called

### Parameters

!!! example "Example of parameters using def function"

	```python
	# functions
	def say_hi(name):
		print('Hi {}!'.format(name))
	
	# vars
	name = input('Fill your name: ')
	
	# run functions
	say_hi('Toto')
	say_hi('Peoples')
	say_hi(name)
	```

!!! faq "Output"

	```shell
	Fill your name: Sam
	Hi Toto!
	Hi Peoples!
	Hi Sam!
	```

#### Default value

In case that the parameter is missing, we can suggest default value

!!! example "Default value parameters"

	```python
	def say_hi(name = 'there'):
		print('Hi {}!'.format(name))
	
	say_hi()
	say_hi('Toto')
	```

!!! faq "Output"

	```python
	Hi there!
	Hi Toto!
	```

Example of more complexe parameters

!!! example "Both of them are named as 'Doe' by default"

	```python
	def say_hi(first, last = 'Doe'):
		print('Hi {} {}!'.format(first, last))
	
	say_hi (last = 'Doe', first = 'Jane')
	say_hi (first = 'John')
	say_hi('Janie', 'Doe')
	say_hi('Johnny')
	```

!!! faq "Output"
	
	```shell
	Hi Jane Doe!
	Hi John Doe!
	Hi Janie Doe!
	Hi Johnny Doe!
	```



### Returning data

Into your function, it could be clever to add like comment as :

`"""Def function usage/utility"""`

```python
def say_hi(first, last = 'Doe'):
	"""Say Hi using firstname and lastname when default one isn't used"""
	print('Hi {} {}!'.format(first, last))
```

Example of returning satus `True` or `False`

!!! example "True/False"

	```python
	def true_or_false(number):
	    """Determine if a number is true or false."""
	
	    if number % 2 == 0:
	        return True
	    else: 
	        return False
	
	print(true_or_false(7))
	```
In this case

!!! faq

	```shell
	False
	```

Use multiple functions nested

!!! example "Nested functions"

	```python
	#!/usr/env/bin python3
	
	# define functions
	def get_name():
	    firstname = input("What's U'r firstname ? ")
	    lastname = input("What's U'r lastname ? ")
	    return firstname
	    return lastname
	
	def say_name(firstname, lastname = 'Doe'):
	    print("U'r name is {} {}.".format(firstname, lastname))
	    print("Yes I know I'm mentalist.")
	
	def get_and_say_name():
	    """Get and display name"""
	    Identity = get_name()
	    say_name(Identity)
	    
	# run function.s
	get_and_say_name()
	```

!!! faq "Output"

	```shell
	What's U'r firstname ? Sam
	What's U'r lastname ? 
	U'r name is Toto Doe.
	Yes I know I'm mentalist
	```

## Virtual venv

AKA `venv` , that is better to use venv to allow using multiple versions and avoid to pollute your machine

!!! info
	
	A virtual environement ne require privileges


### 1. Create python venv (here name `pyvenv`)

```sh
python3 -m venv pyvenv
```

### 2. Source it

```bash
source pyvenv/bin/active
```

### 3. Download module.s

```sh
mkdir module; cd module
pip download module_name
```

### Using file

!!! info "Requirements.txt"

	#### Requierements
	
	You have to fill the module name wished to the `requierements.txt` file. 
	
	This file is used to build your envirement
	
	```bash
	echo "module_name" >> requirements.txt
	```
	
	#### Install virtual environement 
	
	```shell
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
