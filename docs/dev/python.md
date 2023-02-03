# Python

Python tips & tricks

## Syntaxe

Coding:

- Format UTF-8 : ``## -*- coding:Utf-8 -*-``

Shebang:

- `#!/usr/bin/env python3`

## Librairy

### Import

You can import a single module from a library:

```python
from LIBRAIRIE import module
```

You can also import full library:

```python
from LIBRAIRIE import *
```

From python.py file:

```python
from fichier import classe
```

## Keys

How to use keys from list ?

```python
print("My name is %s !" % liste_nom['name']) 
print("My name is %(name)s !" % d)
print("My name is {0} !".format(d['name']))
```

### Check

Use `try` to verify block 

```python
try: ## Vérifier ce bloc
	file = open('infos.txt', 'r')
	print(file.read())
except: ## Si erreur se trouve dans try
	print("erreur")
	finally: ## Qui s'éxecutera quoi qu'il arrive des blocs précédents
file.close
```

The verification can take the form of several methods:

```python
execpt IOError ## Pour se qui concerne les fichier ou élèments en dur
except ValueError ## Qui concernera les érreurs de conversions
```

The safest method remains the 'with' option:

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

## Conparators

### Operators

| Operator | Description |
| :-: | :- |
| == | **Equal** to |
| > | **Greater** then |
| >= | **Greter** than *or* **equal** |
| < | *Less* then |
| <= | **Less** then *or* **equal** |
| != | **Not** equal |

### Example 

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

Result :

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

Mindset of functions :

1. Don't Repeat Yourselft
2. Write one tim, use many times

Example of function code block

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

Example of parameters using def function

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

Result :

```shell
Fill your name: Toto
Hi Toto!
Hi Peoples!
Hi Sam!
```

#### Default value

In case that the parameter is missing, we can suggest default value parameters

```python
def say_hi(name = 'there'):
	print('Hi {}!'.format(name))

say_hi()
say_hi('Toto')
```

Result:

```python
Hi there!
Hi Toto!
```

Example of more complexe parameters.

Both of them are named as 'Doe' by default :

```python
def say_hi(first, last = 'Doe'):
	print('Hi {} {}!'.format(first, last))

say_hi (last = 'Doe', first = 'Jane')
say_hi (first = 'John')
say_hi('Janie', 'Doe')
say_hi('Johnny')
```

Result:

```python
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

```python
False
```

Use multiple functions nested

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

Result :

```python
What's U'r firstname ? Sam
What's U'r lastname ? 
U'r name is Toto Doe.
Yes I know I'm mentalist
```

## Virtual venv

AKA `venv` , that is better to use venv to allow using multiple versions and avoid to pollute your machine

!!! info
	
	A virtual environement ne require privileges

### Create python venv 

Here name  defined is : `pyvenv`

```sh
python3 -m venv pyvenv
```

### Source it

```bash
source pyvenv/bin/active
```

### Download module.s

```shell
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

## Lists

### List

Lists are created using comma separated values between square brackets.

The format is :

```python
list = [item_1, item2, item_X]
```

Items in a list can be accessed by index.

!!! warning

	Lists are zero based

Access items from the end of the list by using negative indice

The last item in a list is : 

```python
list = [-1]
```

Add items to a list by using the `append()` or `extend()` list methods.

Example of code

```python
animals = ['man', 'bear', 'pig']
print(animals[0]) # print the fist item of the index

animals[0] = 'cat' # susbtitute man by cat
print(animals[0]) # reassigned variable
print(animals[-3]) # Negative index (pig man to man<cat)

animals.append('cow') # add cow to the index
more_animals = ['horse', 'turtle'] # agrement the animals index
animals.extend(more_animals) # insert the more_animals list into the animals
print(animals[-1]) # display the first item from the reverse reading

animals.insert(0, 'dog') # insert a new item to the first entry
print(animals) # display index
```

Output :

```python
man
cat
cat
turtle
['dog', 'cat', 'bear', 'pig', 'cow', 'horse', 'turtle'
```

### Slices

Access a portion of a list using a slice.

The format is :

```python
list[start, stop]
```

The list `index()` method accepts a value as a parameter and returns the index of the first value in the list or an exception if the value is not in the list

```python
animals = ['man', 'bear', 'pig', 'cow', 'duck', 'horse']
# Positions man:1, bear:2, pig:3, cow:4, duck:5, horse:6

some_animals = animals[1:4] # display from item 1 to item 4
print('Some animals:    {}'.format(some_animals))

first_two = animals[0:2] # display the two first items
print('Some animals:    {}'.format(first_two))

first_two_again = animals[:2] # display the two first items
print('Some animals:    {}'.format(first_two_again))

last_two = animals[-2:] # display the two last items
print('Some animals:    {}'.format(last_two))

part_of_horse = 'horse'[1:3] # display from the first excluded to the third included 
print(part_of_horse)

prepart_of_horse = 'horse'[:3] # display from the first included to the third included 
print(prepart_of_horse)
```

Output :

```python
Some animals:    ['bear', 'pig', 'cow']
Some animals:    ['man', 'bear']
Some animals:    ['man', 'bear']
Some animals:    ['duck', 'horse']
or
hor
```

### Exception Handing

```python
animals = ['man', 'bear', 'pig']

bear_index = animals.index('bear') # display the bear item position
print(bear_index)

# Searching for 'cat' into the animals index
try:
    cat_index = animals.index('cat')
except:
    cat_index = 'No cats found.'

print(cat_index)
```

Output :

```python
1
No cats found.
```

### Loops

Loop through a list using a for loop.

The format is :

```python
for item_var in list:
	# block of code
```

```python
animals = ['man', 'bear', 'pig']
for animal in animals:
	print(animal)
	print(animal.upper()) # to UPPER list
```

#### While

The code block in a while loop executes as long as the condition evaluates to true.

The format is :

```python
while condition:
	# block of code
```

```python
animals = ['man', 'bear', 'pig']
while animals:
	print(animals) # while there is an item into the animal intex, print-it
```

```python
animals = ['man', 'bear', 'pig', 'cow', 'duck', 'horse']
animal_index = 0 # defined var to loop the animals index

while animal_index < len(animals): # len = output the number of item.s
    print(animals[animal_index])
    animal_index += 1 # increment this variable by listing of the animals index
```

### Sorting

To sort a list, use the `sort()` list method or the built-in `sorted()` function.

```python
animals = ['man', 'bear', 'pig']
sorted_animals = sorted(animals) # sorted() = to sort sorted_animals var
print('Animals list:              {}'.format(animals))
print('Sorted animals list:       {}'.format(sorted_animals))

animals.sort() # .sort() = to globaly sort animals var
print('Animals after sort method: {}'.format(animals))
```

Concatenate two list 

```python
animals = ['man', 'bear', 'pig']
more_animals = ['cow', 'duck', 'horse']
all_animals = animals + more_animals
print(all_animals)
```

To determine the number of any item of list

```python
animals = ['man', 'bear', 'pig']
print(len(animals))   # print the number of items
animals.append('cow') # add cow item into animals
print(len(animals))   # print the number of items (+ cow for now)
```

### Ranges

The built-in `range()` function generates a list of numbers.

The format is :

```python
range(start, stop, step)
```

Range from the list :

```python
for number in range(3): # From 0 included to 3 excluded = 0, 1, 2
	print(number)

for number in range(1, 3): # From 1 included to 3 excluded = 1, 2
    print(number)

for number in range(1, 10, 2): # From 1 included to 1O excluded steped by 2 = 1, 3, 5, 7, 9
    print(number)
```

Based on the item position :

```python
animals = ['man', 'bear', 'pig', 'cow', 'duck', 'horse', 'dog']
for number in range(0, len(animals), 2): # from 0 to animals item numbers steped by 2 = man, pig, duck, dog
    print(animals[number])
```

### Conclusion

Example of code with sections of [Lists](#lists) merged

```python
#!/usr/bin/env python

# var
todo_index = []
done = False

# while done var is 'False'
while not done:
    new_task = input('Enter a task for your to-do list. Press <enter> when done: ')
    if len(new_task) == 0: # if len of new_task is equal to 0
        done = True
    else:
        todo_index.append(new_task) # add entry to the index
        print('Task has been added.')

# display
print()
print('Your To-Do list:')
print('-' * 16)

for task in todo_index: # From index, get items
    print(task)
```

## Dictionaries

the dictionary is a data type that

- Hold key-value pairs called items.
- AKA associative arrays, has tables and hases.

### Creating

### Items

Dictionary referred to as associative arrays hases or hash tables dictionaries using comma-separated items between curly braces

!!! example "Syntax"

	```python
	dictionary_name = {key_1: value_1, key_X: value_X}
	
	dictionary_name = {}
	
	dictionary_name[key]
	```

Value from Key

```python
contacts = {'Jason': '555-0123', 'Carl': '555-0987'}
jasons_phone = contacts['Jason']
carls_phone = contacts['Carl']

print('Dial {} to call Jason.'format(jasons_phone))
print('Dial {} to call Carl.'format(carls_phone))
```

### Adding

Replace Key value from dictionary

```python
contacts = {'Jason': '555-0123', 'Carl': '555-0987'}
contacts['Jason'] = '555-0000'
jasons_phone = contacts['Jason']
print('Dial {} to call Jason.'format(jasons_phone))
```

Add Key from dictionary

```python
contacts = {'Jason': '555-0123', 'Carl': '555-0987'}
contacts = ['Tony'] = '555-0570'
```

#### Removing

Remove key from dictionary using `del`

```python
contacts = {'Jason': '555-0123', 'Carl': '555-0987'}
del contacts['Jason']
```

### Searching

To verify if certain key is existing into a dictionary

```python
contacts = {
	'Jason': ['555-0123', '555-0000'],
	'Carl': '555-0987'
}

if 'Jason' in contacts.keys():
	print("Jason's phone number is:")
	print(contacts['Jason'][0])

if 'Tony' in contacts.keys():
	print("Tony's phone number is:")
	print(contacts['Tony'][0])
```

Output :

```python
Jason's phone number is:
555-0123
```

#### Does it exist ?

True or false will be returned

```python
contacts = {
	'Jason': ['555-0123', '555-0000'],
	'Carl': '555-0987'
}
print('555-0987' in contacts.values())
```

Output :

```python
True
```

### Nesting

Find multiple items attached to a key from list

```python
contacts = {
	'Jason': ['555-0123', '555-0000'],
	'Carl': '555-0987'
}

for number in contacts['Jason']:
	print('Phone number: {}'.format(number))
```

Output :

```python
Phone number: 555-0123
Phone number: 555-0000
```

### Looping

There is the syntax :

```python
for key_variable in dictionary_name:
	# code block
	# dictionary_name[key_variable]

for contact in contacts:
	# code block

for person in people:
	# code block
```

Example :

```python
contacts = {
	'Jason': ['555-0123', '555-0000'],
	'Carl': '555-0987'
}

for contact in contacts:
    print('The number for {0} is {1}.'.format(contact, contacts[contact]))
```

Output :

```python
The number for Jason is ['555-0123', '555-0000'].
The number for Carl is 555-0987.
```

Equivalent to previous example :

```python
contacts = {
	'Jason': ['555-0123', '555-0000'],
	'Carl': '555-0987'
}

for person, phone_number in contacts.items():
    print('The number for {0} is {1}.'.format(person, phone_number))
```

Index nested :

```python
contacts = {
	'Jason': {
        'phone': ['555-0123', '555-0000'],
        'email': 'jsaon@example.com'
    },
    'Carl': {
        'phone': '555-0987',
        'email': 'carl@example.com'
    }
}

for contact in contacts:
    print("{}'s contact info:".format(contact))
    print(contacts[contact]['phone'])
    print(contacts[contact]['email'])

# or

for person in contacts:
    print("The {0}'s phone number is {1}. His mail is {2}".format(person, contacts[person]['phone'], contacts[person]['email']))
```

Output :

```python
Jason's contact info:
['555-0123', '555-0000']
jsaon@example.com
Carl's contact info:
555-0987
carl@example.com

# or

The Jason's phone number is ['555-0123', '555-0000']. His mail is jsaon@example.com
The Carl's phone number is 555-0987. His mail is carl@example.com
```

### Conclusion

Dictionnaries hold key-value pairs, called items

```python
dictionary_name = {key_1: value_1, key_X: value_X}
```

Access the values stored in a dictionary by key

```python
dictionary_name[key]
```

Determine if a value exists use the value in `dictionary_name.values()`, wtich returns a **boolean**.

The `values()` dictionary method returns a list of the values stored in that dictionary.

## TKinter

TKinter is a library to manage window.s

Example of code :

```python
from Tkinter import *
fenetre = Tk()
label = Label(fenetre, text="Exmple de coprs de fenêtre")
label.pack()
fenetre.mainloop()
```

### Customize window

List of elements used to customize a window `window = Tk()*`

- window.title("**My application**")
- window.geometry("720x480")
- window.minsize(700, 300)
- window.iconbitmap("image.ico")
- window.config(background='#CC0000')

### Widget

#### Checkboxes

Checkbox list :

```python
caseACocher1 = Checkbutton(window, text="Box N°1").pack()
caseACocher2 = Checkbutton(window, text="Box N°2").pack()
...
```

#### Input field

```python
value = StringVar()
value.set("Text zone")
entree = Entry(window, textvariable=value, width=30)
entree.pack()
```

#### Menu bar

File menu :

```python
file_menu = Menu(menu_bar, tearoff=0)
file_menu.add_command(label="New", command=generate_password)
file_menu.add_command(label="Quit", command=window.quit)
menu_bar.add_cascade(label="File", menu=file_menu)
```
