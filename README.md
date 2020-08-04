# ![AWS](aws-logo.png) ECS Capacity Provider

Purpose: Blueprints for AWS ECS Capacity Providers.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| asg\_max\_size | Maximum allowed nodes in the cluster | `number` | `3` | no |
| launch\_template | Identifier of Launch Template used for auto-scaling | `any` | n/a | yes |
| name | Name of the capacity provider | `any` | n/a | yes |
| vpc\_default | Indicate whether to deploy in the default VPC | `bool` | `true` | no |
| vpc\_tags | A map of tags to match on the VPC lookup | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| capacity\_provider\_name | Name of the provisioned capacity provider |

