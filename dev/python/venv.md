# Virtual Environment (VENV)

AKA `venv` , that is better to use venv to allow using multiple versions and avoid to pollute your machine

!!! info
	A virtual environement ne require privileges

## Create python venv

Here name  defined is : `pyvenv`

```sh
python3 -m venv pyvenv
```

## Source it

```bash
source pyvenv/bin/active
```

## Download module.s

```shell
mkdir module; cd module
pip download module_name
```

## Using file

!!! info "Requirements.txt"

	#### Requierements
	
	You have to fill the module name wished to the `requierements.txt` file. 
	
	This file is used to build your envirement
	
```bash
echo "module_name" >> requirements.txt
```

### Install virtual environement

```shell
pip install --no-index --find-links module/ -r requirements.txt
```