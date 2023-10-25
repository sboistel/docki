# Remote Exec

## SSH

```terraform
variable "ssh_host" {}
variable "ssh_user" {}
variable "ssh_target" {}

resource "null_resource" "ssh_target" {
    connection {
        type    =   "ssh"
        user    =   var.ssh_user
        host    =   var.ssh_host
        private_key =   file("/home/john-doe/.ssh/id_rsa")
    }
}
```

### remote-exec

```terraform
resource "xxx" "xxx" {

  provisioner "remote-exec" {
    inline = [
            "sudo apt update -qq > /dev/null",
            "sudo apt install nginx -qq > /dev/null"
        ]
    }
  
}
```

### File

```terraform
resource "xxx" "xxx" {

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

}
```
