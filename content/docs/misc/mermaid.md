---
title: "Mermaid"
description: "Mermaid is a simple markdown-like script language for generating charts from text via JavaScript."
tags: ["mermaid", "charts"]
---

``` mermaid
graph LR
  A[Start] --> B{Error?};
  B -->|Yes| C[Hmm...];
  C --> D[Debug];
  D --> B;
  B ---->|No| E[Yay!];
```
