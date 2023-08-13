# Terraform Documentation

A child module automatically inherits its parent's default (un-aliased) provider configurations. The provider versions below are informational only and do **not** need to align with the provider configurations from its parent.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.rules](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_network.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_shared_vpc_host_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_host_project) | resource |
| [google_compute_shared_vpc_service_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_service_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the network to create | `string` | `"osinfra-vpc"` | no |
| <a name="input_project"></a> [project](#input\_project) | The ID of the project in which the resource belongs | `any` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | List of firewall rule definitions | <pre>list(object({<br>    allow = optional(list(object({<br>      ports    = list(string)<br>      protocol = string<br>    })), [])<br><br>    deny = optional(list(object({<br>      ports    = list(string)<br>      protocol = string<br>    })), [])<br><br>    description         = optional(string)<br>    direction           = string<br>    log_config_enabled  = optional(bool, true)<br>    log_config_metadata = optional(string, "INCLUDE_ALL_METADATA")<br>    name                = string<br>    priority            = optional(number)<br>    ranges              = optional(list(string))<br>    source_tags         = optional(list(string))<br>    target_tags         = optional(list(string))<br>  }))</pre> | `[]` | no |
| <a name="input_shared_vpc"></a> [shared\_vpc](#input\_shared\_vpc) | Enable VPC sharing | `bool` | `false` | no |
| <a name="input_shared_vpc_service_projects"></a> [shared\_vpc\_service\_projects](#input\_shared\_vpc\_service\_projects) | The set of service projects to attach to the shared VPC | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The network name |
| <a name="output_project"></a> [project](#output\_project) | The ID of the project in which the resource belongs |
| <a name="output_self_link"></a> [self\_link](#output\_self\_link) | The URI of the created resource |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
