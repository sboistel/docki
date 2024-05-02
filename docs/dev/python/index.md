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
