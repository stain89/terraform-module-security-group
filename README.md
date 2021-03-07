# terraform-module-security-group

#### Example usage

```
module "my-sg" {
   source      = "git@github.com:stain89/terraform-module-security-group.git"
  vpc_id      = "vpc-a27e94ea"
  name        = "test"
  environment = "dev"
  aws_region  = "eu-central-1"
}

resource "aws_security_group_rule" "allow_postgresql" {
  type            = "ingress"
  from_port       = 5432
  to_port         = 5432
  protocol        = "tcp"
  source_security_group_id = "sg-123456"

  security_group_id = "${module.my-sg.security_group_id}"
}
```