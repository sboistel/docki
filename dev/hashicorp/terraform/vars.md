# Variable level(s)

They are multiple variable levels as :

- 1: Environment
- 2: File (terraform.tvars)
- 3: Json File (terraform.tfvars.json)
- 4: Auto File (\*.auto.tfvars or \*.auto.tfvars.json)
- 5: CLI (-var or var-file(*followed by the varfile.tfvars*)

## Environment

```bash
EXPORT VAR_NAME_str="value"
```

## Files

### tfvars

File where terraform vars located

```terraform
VAR_NAME_str="value"
```

### Auto

```terraform title="File: file.auto.tfvars"
str="auto"
```
