# Graph

```terraform
terraform graph | dot -Tsvg > graph.svg
```

Example code :

```diagraph
digraph {
    compound = "true"
    newrank = "true"
    subgraph "root" {
        "[root] aws_instance.test_ec2 (expand)" [label = "aws_instance.test_ec2", shape = "box"]
        "[root] provider[\"registry.terraform.io/hashicorp/aws\"]" [label = "provider[\"registry.terraform.io/hashicorp/aws\"]", shape = "diamond"]
        "[root] aws_instance.test_ec2 (expand)" -> "[root] provider[\"registry.terraform.io/hashicorp/aws\"]"
        "[root] provider[\"registry.terraform.io/hashicorp/aws\"] (close)" -> "[root] aws_instance.test_ec2 (expand)"
        "[root] root" -> "[root] provider[\"registry.terraform.io/hashicorp/aws\"] (close)"
    }
}
```
