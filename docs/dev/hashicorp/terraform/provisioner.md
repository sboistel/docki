# Provisioner

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
    
    provisioner "remote-exec" {
        inline = [
            "sudo apt update -qq > /dev/null",
            "sudo apt install nginx -qq > /dev/null"
        ]
    }

    provisioner "file" {
        source      =   "nginx.conf"
        destination =   "/tmp/default"
    }
}
```

```terraform
resource "aws_instance" "web" {
  # ...

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh args",
    ]
  }
}
```
