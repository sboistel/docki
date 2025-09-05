---
title: "The file Reading/Writing process"
description: ""
tags: [""]
---
---
title: Reading and writing files
description: To read/write to a file in Python, you will want to use the with statement, which will close the file for you after you are done, managing the available resources for you.
---

<base-title :title="frontmatter.title" :description="frontmatter.description">
Reading and Writing Files
</base-title>

## The file Reading/Writing process

To read/write to a file in Python, you will want to use the `with`
statement, which will close the file for you after you are done, managing the available resources for you.

## Opening and reading files

The `open` function opens a file and return a corresponding file object.

```python
>>> with open('C:\Users\your_home_folder\hi.txt') as hello_file:
...     hello_content = hello_file.read()
...
>>> hello_content
'Hello World!'
```

Alternatively, you can use the _readlines()_ method to get a list of string values from the file, one string for each line of text:

```python
>>> with open('sonnet29.txt') as sonnet_file:
...     sonnet_file.readlines()
...
',
',
', And
```

You can also iterate through the file line by line:

```python
>>> with open('sonnet29.txt') as sonnet_file:
...     for line in sonnet_file:
...         print(line, end='')
...
```

## Writing to files

```python
>>> with open('bacon.txt', 'w') as bacon_file:
...     bacon_file.write('Hello world!
')
...

>>> with open('bacon.txt', 'a') as bacon_file:
...     bacon_file.write('Bacon is not a vegetable.')
...

>>> with open('bacon.txt') as bacon_file:
...     content = bacon_file.read()
...
>>> print(content)
```
