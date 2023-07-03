# Comparators

## Operators

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

## Numbers

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

## Parameters

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

### Default value

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
