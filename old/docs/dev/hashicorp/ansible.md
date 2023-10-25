# Ansible Engine

## List d'argument

* -i : Spécifier le fichier d'inventaire
* -C,--check : Vérifier la.es action.s qui sera.ont réalisée.s
* -m : Spécifier le module que l'on souhaite invoquer
* -k : Demander le mot de passe **user**
* -K : Demander le mot de passe **root**
* -b,--become : Éxécuter en tant que **su** (*admin)

## Serveur

### Configuration

file : `ansible.cgf`

```shell
host_key_checking = False
inventory = pve.inventory
```

### Inventory

file : `inventory`

```shell
[Groups]
ansible ansible_hosts=0.0.0.0

[Groups:vars]
ansible_user = John Doe
ansible_password = jdoe
```

## Remote

### Windows

#### WinRM

WinRM is a management protocol used by Windows to remotely communicate with another server.
It is a SOAP-based protocol that communicates over HTTP/HTTPS, and is included in all recent Windows operating systems.
Since Windows Server 2012, WinRM has been enabled by default, but in most cases extra configuration is required to use WinRM with Ansible.

##### Authentification Options

| Option | Local Accounts | Active Directory Accounts | Credential Delegation | HTTP Encryption |
| - | :-: | :-: | :-: | :-: |
| Basic | Yes | No | No | No |
| Certificate | Yes | No | No | No |
| Kerberos | No  | Ye | Ye | Yes |
| NTLM | Yes | Ye | No | Yes |
| CredSSP | Yes | Ye | Ye | Yes |

##### Basic

Basic authentication is one of the simplest authentication options to use, but is also the most insecure.

```yaml
ansible_user: Username
ansible_password: Password
ansible_connection: winrm
ansible_winrm_transport: basic
```

##### CredSSP

CredSSP authentication is a newer authentication protocol that allows credential delegation. This is achieved by encrypting the username and password after authentication has succeeded and sending that to the server using the CredSSP protocol.

To use CredSSP authentication, the host vars are configured like :

```yaml
ansible_user: Username
ansible_password: Password
ansible_connection: winrm
ansible_winrm_transport: credssp
```

There are some extra host variables that can be set as shown below

```yaml
ansible_winrm_credssp_disable_tlsv1_2: when true, will not use TLS 1.2 in the CredSSP auth process
```

CredSSP authentication is not enabled by default on a Windows host, but can be enabled by running the following in PowerShell

```powershell
Enable-WSManCredSSP -Role Server -Force
```

##### Installing CredSSP Library

The `requests-credssp` wrapper can be installed using `pip`:

```shell
pip install pywinrm[credssp]
```

##### TLS 1.2

By default the `requests-credssp` library is configured to authenticate over the TLS 1.2 protocol.
TLS 1.2 is **installed** and enabled by **default** for *Windows Server 2012* and *Windows 8* and more recent releases.

##### Certificate

CredSSP works by encrypting the credentials through the TLS protocol and uses a self-signed certificate by default.
The `CertificateThumbprint` option under the WinRM service configuration can be used to specify the thumbprint of another certificate.

```yaml
# Note the value $certificate_thumbprint will be different in each
# situation, this needs to be set based on the cert that is used.
$certificate_thumbprint = "7C8DCBD5427AFEE6560F4AF524E325915F51172C"

# Set the thumbprint value
Set-Item -Path WSMan:\localhost\Service\CertificateThumbprint -Value $certificate_thumbprint
```

[[https://docs.ansible.com/ansible/latest/os_guide/windows_winrm.html#id9]]
