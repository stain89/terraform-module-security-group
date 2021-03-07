### Generic Security Group Terraform Module

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
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_logs | An access logs block | `map(string)` | `{}` | no |
| connection\_draining | Boolean to enable connection draining | `bool` | `false` | no |
| connection\_draining\_timeout | The time in seconds to allow for connections to drain | `number` | `300` | no |
| create\_elb | Create the elb or not | `bool` | `true` | no |
| cross\_zone\_load\_balancing | Enable cross-zone load balancing | `bool` | `true` | no |
| health\_check | A health check block | `map(string)` | n/a | yes |
| idle\_timeout | The time in seconds that the connection is allowed to be idle | `number` | `60` | no |
| instances | List of instances ID to place in the ELB pool | `list(string)` | `[]` | no |
| internal | If true, ELB will be an internal ELB | `bool` | `false` | no |
| listener | A list of listener blocks | `list(map(string))` | n/a | yes |
| name | The name of the ELB | `string` | `null` | no |
| name\_prefix | The prefix name of the ELB | `string` | `null` | no |
| number\_of\_instances | Number of instances to attach to ELB | `number` | `0` | no |
| security\_groups | A list of security group IDs to assign to the ELB | `list(string)` | n/a | yes |
| subnets | A list of subnet IDs to attach to the ELB | `list(string)` | n/a | yes |
| tags | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_elb\_arn | The ARN of the ELB |
| this\_elb\_dns\_name | The DNS name of the ELB |
| this\_elb\_id | The name of the ELB |
| this\_elb\_instances | The list of instances in the ELB |
| this\_elb\_name | The name of the ELB |
| this\_elb\_source\_security\_group\_id | The ID of the security group that you can use as part of your inbound rules for your load balancer's back-end application instances |
| this\_elb\_zone\_id | The canonical hosted zone ID of the ELB (to be used in a Route 53 Alias record) |
