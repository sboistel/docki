#!/usr/bin/env bash

meta () (
echo "
---
title: "{{ ${title} }}"
description: ""
date: {{ .${datime} }}
# pre: "<b>X. </b>"
tags: [""]
draft: true
---
" > $aoutlol
)

for page in $(find . -type f -name "*.md")
do
    echo ""
    echo $page
    grep "^# " $page | head -1 | sed 's/# //g' | grep -v "No such file or directory"
done
