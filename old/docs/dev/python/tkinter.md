# TKinter

TKinter is a library to manage window.s

Example of code :

```python
from Tkinter import *
fenetre = Tk()
label = Label(fenetre, text="Exmple de coprs de fenêtre")
label.pack()
fenetre.mainloop()
```

## Customize window

List of elements used to customize a window `window = Tk()*`

- window.title("**My application**")
- window.geometry("720x480")
- window.minsize(700, 300)
- window.iconbitmap("image.ico")
- window.config(background='#CC0000')

## Widget

### Checkboxes

Checkbox list :

```python
caseACocher1 = Checkbutton(window, text="Box N°1").pack()
caseACocher2 = Checkbutton(window, text="Box N°2").pack()
...
```

### Input field

```python
value = StringVar()
value.set("Text zone")
entree = Entry(window, textvariable=value, width=30)
entree.pack()
```

### Menu bar

File menu :

```python
file_menu = Menu(menu_bar, tearoff=0)
file_menu.add_command(label="New", command=generate_password)
file_menu.add_command(label="Quit", command=window.quit)
menu_bar.add_cascade(label="File", menu=file_menu)
```
