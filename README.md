# Terraform Azure VNet Module

A reusable Terraform module to create an Azure Resource Group, Virtual Network (VNet), and Subnet.

## Features

- Creates an Azure Resource Group.
- Creates an Azure Virtual Network with a configurable address space.
- Creates a Subnet with configurable address prefixes.
- Exposes resource names, IDs, and network address information through outputs.

## Architecture

This module creates the following resources:

```text
Azure Resource Group
└── Virtual Network
    └── Subnet
```

## Usage

Add the following configuration to your Terraform project.

```hcl
module "network" {
  source = "./modules/vnet"

  rg_config = {
    name     = "demo-rg"
    location = "East US"
  }

  vnet_config = {
    name          = "demo-vnet"
    address_space = ["10.0.0.0/16"]
  }

  subnet_config = {
    name             = "frontend-subnet"
    address_prefixes = ["10.0.1.0/24"]
  }
}
```

## Requirements

| Name | Requirement |
|---|---|
| Terraform | `>= 1.5.0` |
| AzureRM provider | `>= 4.0.0, < 5.0.0` |
| Azure subscription | Required |
| Azure authentication | Must be configured before deployment |

## Inputs

| Name | Description | Type | Required |
|---|---|---|---|
| `rg_config` | Resource Group configuration | Object | Yes |
| `vnet_config` | Virtual Network configuration | Object | Yes |
| `subnet_config` | Subnet configuration | Object | Yes |

### `rg_config`

| Attribute | Description | Example |
|---|---|---|
| `name` | Resource Group name | `demo-rg` |
| `location` | Azure region | `East US` |

### `vnet_config`

| Attribute | Description | Example |
|---|---|---|
| `name` | Virtual Network name | `demo-vnet` |
| `address_space` | VNet address range(s) | `["10.0.0.0/16"]` |

### `subnet_config`

| Attribute | Description | Example |
|---|---|---|
| `name` | Subnet name | `frontend-subnet` |
| `address_prefixes` | Subnet address range(s) | `["10.0.1.0/24"]` |

## Outputs

| Name | Description |
|---|---|
| `resource_group_name` | Name of the created Resource Group |
| `resource_group_id` | ID of the created Resource Group |
| `vnet_name` | Name of the created Virtual Network |
| `vnet_id` | ID of the created Virtual Network |
| `vnet_address_space` | Address space configured for the VNet |
| `subnet_name` | Name of the created Subnet |
| `subnet_id` | ID of the created Subnet |
| `subnet_address_prefixes` | Address prefixes configured for the Subnet |

## Deploy the Resources

Run the following commands from your root Terraform project:

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

To display the outputs:

```bash
terraform output
terraform output vnet_id
terraform output subnet_id
```

## Cleanup

To delete the resources managed by this configuration, run:

```bash
terraform destroy
```

Review the planned changes before confirming destruction.

## Notes

- This module creates one Resource Group, one Virtual Network, and one Subnet.
- The subnet address range must fit within the VNet address space and must not overlap with other subnet ranges.
- Azure resource names must comply with Azure naming requirements.
- Configure Azure authentication and the AzureRM provider in the root Terraform project.
- This module uses the AzureRM provider and does not create Network Security Groups, route tables, or subnet delegations.

## License

Add your preferred open-source license before publishing this module publicly.
