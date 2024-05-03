# Loop

## Loops

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

## While

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
