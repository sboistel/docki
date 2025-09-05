---
title: "Escape characters"
description: ""
tags: [""]
---
---
title: Manipulating strings
description: An escape character is created by typing a backslash \ followed by the character you want to insert.
---

<base-title :title="frontmatter.title" :description="frontmatter.description">
Manipulating Strings
</base-title>

## Escape characters

An escape character is created by typing a backslash `\` followed by the character you want to insert.

| Escape character | Prints as            |
| ---------------- | -------------------- |
| `\'`             | Single quote         |
| `\"`             | Double quote         |
| `	`             | Tab                  |
| `
`             | Newline (line break) |
| `\`             | Backslash            |
| ``             | Backspace            |
| `\ooo`           | Octal value          |
| ``             | Carriage Return      |

```python
>>> print("Hello there!
How are you?
I\'m doing fine.")
```

## Raw strings

A raw string entirely ignores all escape characters and prints any backslash that appears in the string.

```python
>>> print(r"Hello there!
How are you?
I\'m doing fine.")
How are you?
I\'m doing fine.
```

Raw strings are mostly used for <router-link to="/cheatsheet/regular-expressions">regular expression</router-link> definition.

## Multiline Strings

```python
>>> print(
... """Dear Alice,
...
... Eve's cat has been arrested for catnapping,
... cat burglary, and extortion.
...
... Sincerely,
... Bob"""
... )



```

## Indexing and Slicing strings

    H   e   l   l   o       w   o   r   l   d    !
    0   1   2   3   4   5   6   7   8   9   10   11

### Indexing

```python
>>> spam = 'Hello world!'

>>> spam[0]

>>> spam[4]

>>> spam[-1]
```

### Slicing

```python
>>> spam = 'Hello world!'

>>> spam[0:5]

>>> spam[:5]

>>> spam[6:]

>>> spam[6:-1]

>>> spam[:-1]

>>> spam[::-1]

>>> fizz = spam[0:5]
>>> fizz
```

## The in and not in operators

```python
>>> 'Hello' in 'Hello World'

>>> 'Hello' in 'Hello'

>>> 'HELLO' in 'Hello World'

>>> '' in 'spam'

>>> 'cats' not in 'cats and dogs'
```

## upper(), lower() and title()

Transforms a string to upper, lower and title case:

```python
>>> greet = 'Hello world!'
>>> greet.upper()

>>> greet.lower()

>>> greet.title()
```

## isupper() and islower() methods

Returns `True` or `False` after evaluating if a string is in upper or lower case:

```python
>>> spam = 'Hello world!'
>>> spam.islower()

>>> spam.isupper()

>>> 'HELLO'.isupper()

>>> 'abc12345'.islower()

>>> '12345'.islower()

>>> '12345'.isupper()
```

## The isX string methods

| Method      | Description                                                                                                                    |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------ |
| isalpha()   | returns `True` if the string consists only of letters.                                                                         |
| isalnum()   | returns `True` if the string consists only of letters and numbers.                                                             |
| isdecimal() | returns `True` if the string consists only of numbers.                                                                         |
| isspace()   | returns `True` if the string consists only of spaces, tabs, and new-lines.                                                     |
| istitle()   | returns `True` if the string consists only of words that begin with an uppercase letter followed by only lowercase characters. |

## startswith() and endswith()

```python
>>> 'Hello world!'.startswith('Hello')

>>> 'Hello world!'.endswith('world!')

>>> 'abc123'.startswith('abcdef')

>>> 'abc123'.endswith('12')

>>> 'Hello world!'.startswith('Hello world!')

>>> 'Hello world!'.endswith('Hello world!')
```

## join() and split()

### join()

The `join()` method takes all the items in an iterable, like a <router-link to="/cheatsheet/lists-and-tuples">list</router-link>, <router-link to="/cheatsheet/dictionaries">dictionary</router-link>, <router-link to="/cheatsheet/lists-and-tuples#the-tuple-data-type">tuple</router-link> or <router-link to="/cheatsheet/sets">set</router-link>, and joins them into a string. You can also specify a separator.

```python
>>> ''.join(['My', 'name', 'is', 'Simon'])
'MynameisSimon'

>>> ', '.join(['cats', 'rats', 'bats'])

>>> ' '.join(['My', 'name', 'is', 'Simon'])

>>> 'ABC'.join(['My', 'name', 'is', 'Simon'])
```

### split()

The `split()` method splits a `string` into a `list`. By default, it will use whitespace to separate the items, but you can also set another character of choice:

```python
>>> 'My name is Simon'.split()

>>> 'MyABCnameABCisABCSimon'.split('ABC')

>>> 'My name is Simon'.split('m')

>>> ' My  name is  Simon'.split()

>>> ' My  name is  Simon'.split(' ')
```

## Justifying text with rjust(), ljust() and center()

```python
>>> 'Hello'.rjust(10)

>>> 'Hello'.rjust(20)

>>> 'Hello World'.rjust(20)

>>> 'Hello'.ljust(10)

>>> 'Hello'.center(20)
```

An optional second argument to `rjust()` and `ljust()` will specify a fill character apart from a space character:

```python
>>> 'Hello'.rjust(20, '*')

>>> 'Hello'.ljust(20, '-')

>>> 'Hello'.center(20, '=')
```

## Removing whitespace with strip(), rstrip(), and lstrip()

```python
>>> spam = '    Hello World     '
>>> spam.strip()

>>> spam.lstrip()

>>> spam.rstrip()

>>> spam = 'SpamSpamBaconSpamEggsSpamSpam'
>>> spam.strip('ampS')
```
