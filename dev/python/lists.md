# Lists

## Keys

How to use keys from list ?

```python
print("My name is %s !" % liste_nom['name']) 
print("My name is %(name)s !" % d)
print("My name is {0} !".format(d['name']))
```

## List

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

## Slices

Access a portion of a list using a slice.

The format is :

```python
list[start, stop]
```

The list `index()` method accepts a value as a parameter and returns the index of the first value in the list or an exception if the value is not in the list

```python
animals = ['man', 'bear', 'pig', 'cow', 'duck', 'horse']
 Positions man:1, bear:2, pig:3, cow:4, duck:5, horse:6

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

## Exception Handing

```python
animals = ['man', 'bear', 'pig']

bear_index = animals.index('bear') # display the bear item position
print(bear_index)

 Searching for 'cat' into the animals index
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
