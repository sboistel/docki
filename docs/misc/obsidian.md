# Obsidian

## Admonitions

### Types

The following admonition types are currently supported:

| Type     | Aliases                     |
| -------- | --------------------------- |
| note     | note, seealso               |
| abstract | abstract, summary, tldr     |
| info     | info, todo                  |
| tip      | tip, hint, important        |
| success  | success, check, done        |
| question | question, help, faq         |
| warning  | warning, caution, attention |
| failure  | failure, fail, missing      |
| danger   | danger, error               |
| bug      | bug                         |
| example  | example                     |
| quote    | quote, cite                 |

### Parameters

```
```ad- # Admonition type. See below for a list of available types.
title: # Admonition title.
collapse: # Create a collapsible admonition.
icon: # Override the icon.
color: # Override the color.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla.
```

#### Example 

Note : (`ad-note`)

```ad-note
title: This is a note

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et
euismod nulla. Curabitur feugiat, tortor non consequat finibus, justo
purus auctor massa, nec semper lorem quam in massa.
```

