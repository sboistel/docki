---
title: modules
description: ""
date: 2024-05-03T16:13:45+02:00
tags: []
categories: []
draft: true
slug: ""
---

## Modules

`tf` files consolidation were ressources related

Terraform module are actually ansible roles

## How to

How to call modules ?

```terraform
module "module_name" {
    source = "./dir_module_name"
}
```

### Install

```terraform
terraform get
terraform init
```

### Manage dependances

```terraform
terraform apply -target=module.docker
terraform apply -target=module.postgres
```

* Rq : via variables

## Structure

* simple

```
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
```

* complexier

```
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── ...
├── modules/
│   ├── nestedA/
│   │   ├── README.md
│   │   ├── variables.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   ├── nestedB/
│   ├── .../
├── examples/
│   ├── exampleA/
│   │   ├── main.tf
│   ├── exampleB/
│   ├── .../
```
