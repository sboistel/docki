---
title: "Linux and Windows Paths"
description: ""
tags: [""]
---
---
title: File and directory Paths
description: There are two main modules in Python that deals with path manipulation. One is the os.path module and the other is the pathlib module.
---

<base-title :title="frontmatter.title" :description="frontmatter.description">
Handling file and directory Paths
</base-title>

There are two main modules in Python that deal with path manipulation.
One is the `os.path` module and the other is the `pathlib` module.

<base-disclaimer>
  <base-disclaimer-title>
    os.path VS pathlib
  </base-disclaimer-title>
  <base-disclaimer-content>
    The `pathlib` module was added in Python 3.4, offering an object-oriented way to handle file system paths.
  </base-disclaimer-content>
</base-disclaimer>

## Linux and Windows Paths

On Windows, paths are written using backslashes (`\`) as the separator between
folder names. On Unix based operating system such as macOS, Linux, and BSDs,
the forward slash (`/`) is used as the path separator. Joining paths can be
a headache if your code needs to work on different platforms.

Fortunately, Python provides easy ways to handle this. We will showcase
how to deal with both, `os.path.join` and `pathlib.Path.joinpath`

Using `os.path.join` on Windows:

```python
>>> import os

>>> os.path.join('usr', 'bin', 'spam')
```

And using `pathlib` on \*nix:

```python
>>> from pathlib import Path

>>> print(Path('usr').joinpath('bin').joinpath('spam'))
```

`pathlib` also provides a shortcut to joinpath using the `/` operator:

```python
>>> from pathlib import Path

>>> print(Path('usr') / 'bin' / 'spam')
```

Notice the path separator is different between Windows and Unix based operating
system, that's why you want to use one of the above methods instead of
adding strings together to join paths together.

Joining paths is helpful if you need to create different file paths under
the same directory.

Using `os.path.join` on Windows:

```python
>>> my_files = ['accounts.txt', 'details.csv', 'invite.docx']

>>> for filename in my_files:
...     print(os.path.join('C:\Users\asweigart', filename))
...
```

Using `pathlib` on \*nix:

```python
>>> my_files = ['accounts.txt', 'details.csv', 'invite.docx']
>>> home = Path.home()
>>> for filename in my_files:
...     print(home / filename)
...
```

## The current working directory

Using `os` on Windows:

```python
>>> import os

>>> os.getcwd()
>>> os.chdir('C:\Windows\System32')

>>> os.getcwd()
```

Using `pathlib` on \*nix:

```python
>>> from pathlib import Path
>>> from os import chdir

>>> print(Path.cwd())

>>> chdir('/usr/lib/python3.6')
>>> print(Path.cwd())
```

## Creating new folders

Using `os` on Windows:

```python
>>> import os
>>> os.makedirs('C:\delicious\walnut\waffles')
```

Using `pathlib` on \*nix:

```python
>>> from pathlib import Path
>>> cwd = Path.cwd()
>>> (cwd / 'delicious' / 'walnut' / 'waffles').mkdir()
```

Oh no, we got a nasty error! The reason is that the 'delicious' directory does
not exist, so we cannot make the 'walnut' and the 'waffles' directories under
it. To fix this, do:

```python
>>> from pathlib import Path
>>> cwd = Path.cwd()
>>> (cwd / 'delicious' / 'walnut' / 'waffles').mkdir(parents=True)
```

And all is good :)

## Absolute vs. Relative paths

There are two ways to specify a file path.

- An **absolute path**, which always begins with the root folder
- A **relative path**, which is relative to the program’s current working directory

There are also the dot (`.`) and dot-dot (`..`) folders. These are not real folders, but special names that can be used in a path. A single period (“dot”) for a folder name is shorthand for “this directory.” Two periods (“dot-dot”) means “the parent folder.”

### Handling Absolute paths

To see if a path is an absolute path:

Using `os.path` on \*nix:

```python
>>> import os
>>> os.path.isabs('/')

>>> os.path.isabs('..')
```

Using `pathlib` on \*nix:

```python
>>> from pathlib import Path
>>> Path('/').is_absolute()

>>> Path('..').is_absolute()
```

You can extract an absolute path with both `os.path` and `pathlib`

Using `os.path` on \*nix:

```python
>>> import os
>>> os.getcwd()
'/home/asweigart'

>>> os.path.abspath('..')
'/home'
```

Using `pathlib` on \*nix:

```python
from pathlib import Path
print(Path.cwd())

print(Path('..').resolve())
```

### Handling Relative paths

You can get a relative path from a starting path to another path.

Using `os.path` on \*nix:

```python
>>> import os
>>> os.path.relpath('/etc/passwd', '/')
```

Using `pathlib` on \*nix:

```python
>>> from pathlib import Path
>>> print(Path('/etc/passwd').relative_to('/'))
```

## Path and File validity

### Checking if a file/directory exists

Using `os.path` on \*nix:

```python
>>> import os

>>> os.path.exists('.')

>>> os.path.exists('setup.py')

>>> os.path.exists('/etc')

>>> os.path.exists('nonexistentfile')
```

Using `pathlib` on \*nix:

```python
from pathlib import Path

>>> Path('.').exists()

>>> Path('setup.py').exists()

>>> Path('/etc').exists()

>>> Path('nonexistentfile').exists()
```

### Checking if a path is a file

Using `os.path` on \*nix:

```python
>>> import os

>>> os.path.isfile('setup.py')

>>> os.path.isfile('/home')

>>> os.path.isfile('nonexistentfile')
```

Using `pathlib` on \*nix:

```python
>>> from pathlib import Path

>>> Path('setup.py').is_file()

>>> Path('/home').is_file()

>>> Path('nonexistentfile').is_file()
```

### Checking if a path is a directory

Using `os.path` on \*nix:

```python
>>> import os

>>> os.path.isdir('/')

>>> os.path.isdir('setup.py')

>>> os.path.isdir('/spam')
```

Using `pathlib` on \*nix:

```python
>>> from pathlib import Path

>>> Path('/').is_dir()

>>> Path('setup.py').is_dir()

>>> Path('/spam').is_dir()
```

## Getting a file's size in bytes

Using `os.path` on Windows:

```python
>>> import os

>>> os.path.getsize('C:\Windows\System32\calc.exe')
```

Using `pathlib` on \*nix:

```python
>>> from pathlib import Path

>>> stat = Path('/bin/python3.6').stat()
>>> print(stat) # stat contains some other information about the file as well

>>> print(stat.st_size) # size in bytes
```

## Listing directories

Listing directory contents using `os.listdir` on Windows:

```python
>>> import os

>>> os.listdir('C:\Windows\System32')
```

Listing directory contents using `pathlib` on \*nix:

```python
>>> from pathlib import Path

>>> for f in Path('/usr/bin').iterdir():
...     print(f)
...
```

## Directory file sizes

<base-warning>
  <base-warning-title>
    WARNING
  </base-warning-title>
  <base-warning-content>
    Directories themselves also have a size! So, you might want to check for whether a path is a file or directory using the methods in the methods discussed in the above section.
  </base-warning-content>
</base-warning>

Using `os.path.getsize()` and `os.listdir()` together on Windows:

```python
>>> import os
>>> total_size = 0

>>> for filename in os.listdir('C:\Windows\System32'):
...     total_size = total_size + os.path.getsize(os.path.join('C:\Windows\System32', filename))
...
>>> print(total_size)
```

Using `pathlib` on \*nix:

```python
>>> from pathlib import Path

>>> total_size = 0
>>> for sub_path in Path('/usr/bin').iterdir():
...     total_size += sub_path.stat().st_size
...
>>> print(total_size)
```

## Copying files and folders

The `shutil` module provides functions for copying files, as well as entire folders.

```python
>>> import shutil, os

>>> os.chdir('C:\')
>>> shutil.copy('C:\spam.txt', 'C:\delicious')

>>> shutil.copy('eggs.txt', 'C:\delicious\eggs2.txt')
```

While `shutil.copy()` will copy a single file, `shutil.copytree()` will copy an entire folder and every folder and file contained in it:

```python
>>> import shutil, os

>>> os.chdir('C:\')
>>> shutil.copytree('C:\bacon', 'C:\bacon_backup')
```

## Moving and Renaming

```python
>>> import shutil

>>> shutil.move('C:\bacon.txt', 'C:\eggs')
```

The destination path can also specify a filename. In the following example, the source file is moved and renamed:

```python
>>> shutil.move('C:\bacon.txt', 'C:\eggs\new_bacon.txt')
```

If there is no eggs folder, then `move()` will rename bacon.txt to a file named eggs:

```python
>>> shutil.move('C:\bacon.txt', 'C:\eggs')
```

## Deleting files and folders

- Calling `os.unlink(path)` or `Path.unlink()` will delete the file at path.

- Calling `os.rmdir(path)` or `Path.rmdir()` will delete the folder at path. This folder must be empty of any files or folders.

- Calling `shutil.rmtree(path)` will remove the folder at path, and all files and folders it contains will also be deleted.

## Walking a Directory Tree

```python
>>> import os
>>>
>>> for folder_name, subfolders, filenames in os.walk('C:\delicious'):
...     print(f'The current folder is {folder_name}')
...     for subfolder in subfolders:
...         print('SUBFOLDER OF {folder_name}: {subfolder}')
...     for filename in filenames:
...         print('FILE INSIDE {folder_name}: filename{filename}')
...     print('')
...
