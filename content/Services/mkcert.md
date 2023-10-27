# Certificate Generator

## How to

How to use this script ?

Open a terminal and run a ssh connection to pki-adm :

```bash
ssh pki-adm
```

You should be logged as `su` :

```bash
sudo su -
```

You are able to run this script from everywhere.

## Run

Simply run this script like :

```bash
mkcert
```

This script will return you theses informations :

```bash
Welcome to the cert gen
Please follow these steps :
Enter the name ONLY :  Barack
Enter the surname ONLY :  OBAMA
Fill wich type would you want : 'client' or 'operator' :  client
```

---

## Raw script

```shell
#!/bin/bash
#
# Written by sboistel on June 2021
#
# Create user certificate

# Var
bin=/usr/local/bin
key_pass=$(cat /dev/urandom | tr -dc 'a-z0-9' | head -c 16) # Generate random password
Pki=/etc/pki/ # root folder of reverse-${type}

# Welcome
echo ""
echo "Welcome to the cert gen"
echo "Please follow these steps :"
echo "Enter the name ONLY :  Barack"
echo "Enter the surname ONLY :  OBAMA"
echo "Fill wich type would you want : 'client' or 'operator' :  client"
echo ""

# Get Informaitons
## User information
### Name
read -rp "Enter the name ONLY : " name
na=$(echo ${name,,} | cut -c 1) # 1st letter of name lowercasedededed

### Surname
read -rp "Enter the surname ONLY : " surname
surna=${surname,,} # surname lowercased

### Username
username=${na}${surna} #1st letter of name + surname

## Type of user
echo "Fill wich type would you want : 'client' or 'operator' : "
types=("client" "operator")

select typ in "${types[@]}" ; do
        case "$typ" in
                "client")
                         ctype="client" && break
                         ;;
                 "operator")
                         ctype="operator" && break
                         ;;
                 *)
                         echo "Wrong choice, please select the number of the type you want."
                         ;;
        esac
done

### Working Directory : Determine the user type trough the $ctype
if [ "$ctype" = "client" ]; then
	WD=$Pki/reverse-client/users
elif [ "$ctype" = "operator" ]; then
	WD=$Pki/reverse-operator/users
fi

### CA Directory : Determine the CA type trough the $ctype
if [ "$ctype" = "client" ]; then
	ca_type=$Pki/reverse-client/intermediate-CA
elif [ "$ctype" = "operator" ]; then
	ca_type=$Pki/reverse-operator/intermediate-CA
fi

# Traitement
## Creating Directory
echo "Go to the $username directory"
mkdir -pv $WD/$username
cd $WD/$username

## Create the credentials for the SSM
echo "# $username credentials" >> ${username}_key_pass.md
echo "> $key_pass" >> ${username}_key_pass.md

## Let's Certificate
### KEY
echo "Generate the $username key"
openssl genrsa -des3 -passout pass:${key_pass} -out ${username}.key 4096

### CSR
echo "Generate the $username csr"
openssl req -new -key $username.key -passin pass:${key_pass} -out $username.csr  -subj "/C=FR/ST=France/L=Paris/O=Docki/OU=sboistel/CN=Intermediate CA"

### Make Cert / P12
#### Generate the Cert with the CA
echo "Generate the $username crt"
$bin/make-crt-with-intermediate-ca $username $ca_type

#### Generate the P12 with the CA
echo "Generate the $username p12"
$bin/make-p12-with-intermediate-ca $username $ca_type

# End Print
echo "The $username's certificat has been created."
echo "The credentials are stored into the ${username}_key_pass.md file :"
echo "Let's communicate the key password to the SSM/user"
cat ${username}_key_pass.md

# EOF
```
