---
title: "Getting values with indexes"
description: ""
tags: [""]
---
---
title: Python Lists and Tuples
description: In python, Lists are are one of the 4 data types in Python used to store collections of data.
---

<base-title :title="frontmatter.title" :description="frontmatter.description">
Python Lists
</base-title>

Lists are one of the 4 data types in Python used to store collections of data.

```python
['John', 'Peter', 'Debora', 'Charles']
```

## Getting values with indexes

```python
>>> furniture = ['table', 'chair', 'rack', 'shelf']

>>> furniture[0]

>>> furniture[1]

>>> furniture[2]

>>> furniture[3]
```

## Negative indexes

```python
>>> furniture = ['table', 'chair', 'rack', 'shelf']

>>> furniture[-1]

>>> furniture[-3]

>>> f'The {furniture[-1]} is bigger than the {furniture[-3]}'
```

## Getting sublists with Slices

```python
>>> furniture = ['table', 'chair', 'rack', 'shelf']

>>> furniture[0:4]

>>> furniture[1:3]

>>> furniture[0:-1]

>>> furniture[:2]

>>> furniture[1:]

>>> furniture[:]
```

Slicing the complete list will perform a copy:

```python
>>> spam2 = spam[:]

>>> spam.append('dog')
>>> spam

>>> spam2
```

## Getting a list length with len()

```python
>>> furniture = ['table', 'chair', 'rack', 'shelf']
>>> len(furniture)
```

## Changing values with indexes

```python
>>> furniture = ['table', 'chair', 'rack', 'shelf']

>>> furniture[0] = 'desk'
>>> furniture

>>> furniture[2] = furniture[1]
>>> furniture

>>> furniture[-1] = 'bed'
>>> furniture
```

## Concatenation and Replication

```python
>>> [1, 2, 3] + ['A', 'B', 'C']

>>> ['X', 'Y', 'Z'] * 3

>>> my_list = [1, 2, 3]
>>> my_list = my_list + ['A', 'B', 'C']
>>> my_list
```

## Using for loops with Lists

```python
>>> furniture = ['table', 'chair', 'rack', 'shelf']

>>> for item in furniture:
...     print(item)
```

## Getting the index in a loop with enumerate()

```python
>>> furniture = ['table', 'chair', 'rack', 'shelf']

>>> for index, item in enumerate(furniture):
...     print(f'index: {index} - item: {item}')
```

## Loop in Multiple Lists with zip()

```python
>>> furniture = ['table', 'chair', 'rack', 'shelf']
>>> price = [100, 50, 80, 40]

>>> for item, amount in zip(furniture, price):
...     print(f'The {item} costs ${amount}')
```

## The in and not in operators

```python
>>> 'rack' in ['table', 'chair', 'rack', 'shelf']

>>> 'bed' in ['table', 'chair', 'rack', 'shelf']

>>> 'bed' not in furniture

>>> 'rack' not in furniture
```

## The Multiple Assignment Trick

The multiple assignment trick is a shortcut that lets you assign multiple variables with the values in a list in one line of code. So instead of doing this:

```python
>>> furniture = ['table', 'chair', 'rack', 'shelf']
>>> table = furniture[0]
>>> chair = furniture[1]
>>> rack = furniture[2]
>>> shelf = furniture[3]
```

You could type this line of code:

```python
>>> furniture = ['table', 'chair', 'rack', 'shelf']
>>> table, chair, rack, shelf = furniture

>>> table

>>> chair

>>> rack

>>> shelf
```

The multiple assignment trick can also be used to swap the values in two variables:

```python
>>> a, b = 'table', 'chair'
>>> a, b = b, a
>>> print(a)

>>> print(b)
```

## The index Method

The `index` method allows you to find the index of a value by passing its name:

```python
>>> furniture = ['table', 'chair', 'rack', 'shelf']
>>> furniture.index('chair')
```

## Adding Values

### append()

`append` adds an element to the end of a `list`:

```python
>>> furniture = ['table', 'chair', 'rack', 'shelf']
>>> furniture.append('bed')
>>> furniture
```

### insert()

`insert` adds an element to a `list` at a given position:

```python
>>> furniture = ['table', 'chair', 'rack', 'shelf']
>>> furniture.insert(1, 'bed')
>>> furniture
```

## Removing Values

### del()

`del` removes an item using the index:

```python
>>> furniture = ['table', 'chair', 'rack', 'shelf']
>>> del furniture[2]
>>> furniture

>>> del furniture[2]
>>> furniture
```

### remove()

`remove` removes an item with using actual value of it:

```python
>>> furniture = ['table', 'chair', 'rack', 'shelf']
>>> furniture.remove('chair')
>>> furniture
```

<base-warning>
  <base-warning-title>
    Removing repeated items
  </base-warning-title>
  <base-warning-content>
    If the value appears multiple times in the list, only the first instance of the value will be removed.
  </base-warning-content>
</base-warning>

### pop()

By default, `pop` will remove and return the last item of the list. You can also pass the index of the element as an optional parameter:

```python
>>> animals = ['cat', 'bat', 'rat', 'elephant']

>>> animals.pop()
'elephant'

>>> animals
['cat', 'bat', 'rat']

>>> animals.pop(0)
'cat'

>>> animals
['bat', 'rat']
```

## Sorting values with sort()

```python
>>> numbers = [2, 5, 3.14, 1, -7]
>>> numbers.sort()
>>> numbers

furniture = ['table', 'chair', 'rack', 'shelf']
furniture.sort()
furniture
```

You can also pass `True` for the `reverse` keyword argument to have `sort()` sort the values in reverse order:

```python
>>> furniture.sort(reverse=True)
>>> furniture
```

If you need to sort the values in regular alphabetical order, pass `str.lower` for the key keyword argument in the sort() method call:

```python
>>> letters = ['a', 'z', 'A', 'Z']
>>> letters.sort(key=str.lower)
>>> letters
```

You can use the built-in function `sorted` to return a new list:

```python
>>> furniture = ['table', 'chair', 'rack', 'shelf']
>>> sorted(furniture)
```

## The Tuple data type

<base-disclaimer>
  <base-disclaimer-title>
    <a target="_blank" href="https://stackoverflow.com/questions/1708510/list-vs-tuple-when-to-use-each">Tuples vs Lists</a>
  </base-disclaimer-title>
  <base-disclaimer-content>
    The key difference between tuples and lists is that, while <code>tuples</code> are <i>immutable</i> objects, <code>lists</code> are <i>mutable</i>. This means that tuples cannot be changed while the lists can be modified. Tuples are more memory efficient than the lists.
  </base-disclaimer-content>
</base-disclaimer>

```python
>>> furniture = ('table', 'chair', 'rack', 'shelf')

>>> furniture[0]

>>> furniture[1:3]

>>> len(furniture)
```

The main way that tuples are different from lists is that tuples, like strings, are immutable.

## Converting between list() and tuple()

```python
>>> tuple(['cat', 'dog', 5])

>>> list(('cat', 'dog', 5))

>>> list('hello')
```
