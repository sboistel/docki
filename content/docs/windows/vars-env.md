---
title: "Environment Variables in Windows"
description: ""
tags: [""]
---

## How to use them in PowerShell

Environment Varaibles can be used in PowerShell ([[powershell]]) with the prefix `$env:`.

### Example

* Variable: `%APPDATA%`
* In Powershell: `$env:APPDATA`

## List of environment variables

| Variable | Description |
| - | - |
| `%ALLUSERSPROFILE%` | C:\ProgramData |
| `%APPDATA%` | C:\Users\{username}\AppData\Roaming |
| `%COMMONPROGRAMFILES%` | C:\Program Files\Common Files |
| `%COMMONPROGRAMFILES(x86)%` | C:\Program Files (x86)\Common Files |
| `%CommonProgramW6432%` | C:\Program Files\Common Files |
| `%COMSPEC%` | C:\Windows\System32
