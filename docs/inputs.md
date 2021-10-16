## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_name | Application name of project | `string` | `"acipvt"` | no |
| container\_name | The name of the container | `string` | n/a | yes |
| cost\_center | The cost\_center name for this project | `string` | `"personal budget"` | no |
| cpu\_core\_number | The required number of CPU cores of the containers | `any` | n/a | yes |
| dns\_name\_label | DNS label name to get added to aci | `any` | n/a | yes |
| environment | The environment name | `string` | n/a | yes |
| image\_name | The container image name | `string` | n/a | yes |
| ipconf\_name | The nic name for the compute resource | `string` | n/a | yes |
| location | The Location for Infra centre | `string` | `"West Europe"` | no |
| memory\_size | The required memory of the containers in GB | `any` | n/a | yes |
| os\_type | The OS for the container group. Allowed values are Linux and Windows | `string` | n/a | yes |
| owner | The name of the infra provisioner or owner | `string` | `"Prem"` | no |
| port\_number | A public port for the container | `any` | n/a | yes |
| pub\_subnet\_name | The cluster network subnet resource name | `string` | n/a | yes |
| pvt\_subnet\_name | The cluster network subnet resource name | `string` | n/a | yes |
| vnet\_name | The core network environment vnet name | `string` | n/a | yes |
| vnet\_rg\_name | The core network vnet resource group name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| aci\_fqdn | The FQDN of the created container group |
| aci\_id | The ID of the created container group |
| aci\_ip\_addr | The IP address of the created container group |

