# Dictionaries

the dictionary is a data type that

- Hold key-value pairs called items.
- AKA associative arrays, has tables and hases.

## Creating

## Items

Dictionary referred to as associative arrays hases or hash tables dictionaries using comma-separated items between curly braces

```nodejs title="> $ node at_inventory_hosts.js byt byt_inventory all"
Test
```

```python title="Syntax"
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

## Adding

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

### Removing

Remove key from dictionary using `del`

```python
contacts = {'Jason': '555-0123', 'Carl': '555-0987'}
del contacts['Jason']
```

## Searching

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

### Does it exist ?

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

## Nesting

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

## Looping

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

 or

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

 or

The Jason's phone number is ['555-0123', '555-0000']. His mail is jsaon@example.com
The Carl's phone number is 555-0987. His mail is carl@example.com
```

## Conclusion

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
