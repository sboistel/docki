# About

## What is Terraform ?

Terraform is an infrastructure as code tool that lets you build, change, and version cloud and on-prem resources safely and efficiently.

### How does it works ?

Terraform creates and manages resources on cloud platforms and other services through their application programming interfaces (APIs). Providers enable Terraform to work with virtually any platform or service with an accessible API.

The core Terraform workflow consists of three stages:

- Write: You define resources, which may be across multiple cloud providers and services. For example, you might create a configuration to deploy an application on virtual machines in a Virtual Private Cloud (VPC) network with security groups and a load balancer.

- Plan: Terraform creates an execution plan describing the infrastructure it will create, update, or destroy based on the existing infrastructure and your configuration.

- Apply: On approval, Terraform performs the proposed operations in the correct order, respecting any resource dependencies. For example, if you update the properties of a VPC and change the number of virtual machines in that VPC, Terraform will recreate the VPC before scaling the virtual machines.

![Workflow](resources/terraform-processe.png)

## Syntaxe

Travaillons sur un fichier ``main.tf``

## Exemple

```bash
output "VAR" {
    value = "Hello World! "
}
```

### Apply

```bash
terraform apply
```

## Variable level(s)

They are multiple variable levels as :

- 1: Environment
- 2: File (terraform.tvars)
- 3: Json File (terraform.tfvars.json)
- 4: Auto File (\*.auto.tfvars or \*.auto.tfvars.json)
- 5: CLI (-var or var-file(*followed by the varfile.tfvars*)

### Environment

```bash
EXPORT VAR_NAME_str="value"
```

### Files

#### tfvars

File where terraform vars located

```terraform
VAR_NAME_str="value"
```

#### Auto

```terraform title="File: file.auto.tfvars"
str="auto"
```
