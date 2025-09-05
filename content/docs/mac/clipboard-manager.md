---
title: "Clipboard Manager"
description: "Clipboard management on macOS"
tags: ["mac", "clipboard"]
---

How to copy from terminal using `pbcopy` ?

```zsh
echo "Hello World!" | pbcopy
```

How to paste ?

```zsh
~ $ pbpaste
Tue Dec 27 15:41:22 CET 2022
```

```zsh
echo "Hello Word!" | pbcopy
```

How to paste ?
```zsh
~ $ pbpaste
Hello Word!

```zsh
~ $ pbpaste
Tue Dec 27 15:41:22 CET 2022
```

## Maccy

Maccy is a lightweight clipboard manager for macOS. It keeps the history of what you copy and lets you quickly navigate, search, and use previous clipboard contents.

Repository link : [https://github.com/p0deje/Maccy](https://github.com/p0deje/Maccy)

Installation :

```zsh
brew install --cask maccy
```
