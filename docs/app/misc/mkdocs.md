---
title: "MKDocs"
description: "MKDocs is a fast, simple, and downright gorgeous static site generator that's geared towards building project documentation."
tags: ["mkdocs", "documentation"]
---

## Material

### Admonition

```yml
markdown_extensions:
  - admonition
  - pymdownx.details
  - pymdownx.superfences
```

#### Supported types

Following is a list of type qualifiers provided by Material for MkDocs, whereas
the default type, and thus fallback for unknown type qualifiers, is `note`[^1]:

  [^1]:
    Previously, some of the supported types defined more than one qualifier.
    For example, authors could use `summary` or `tldr` as alternative qualifiers
    to render an ##### abstract admonition. As this increased the
    size of the CSS that is shipped with Material for MkDocs, the additional
    type qualifiers are now all deprecated and will be removed in the next major
    version. This will also be mentioned in the upgrade guide.

#### How to

Use the type belong `!!!` as :

```note
!!! note

        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.
```

Verbs list :

* note
* abstract
* info
* tip
* success
* question
* warning
* failure
* danger
* bug
* example
* quote
