#1 declare value
resource_group_name = "dev-01"
location = "eastus"


# environment
environment_name = "dev"
tags = {
  "environment" = "dev"
}


storage_account_name     = "simpletest"
account_tier             = "Standard"
account_replication_type = "GRS"



subnets = [
    {
      name    = "subnet1"
      address_prefix = "10.0.1.0/24"
    },
    {
      name    = "data-subnet"
      address_prefix = "10.0.2.0/24"
    },
    {
      name    = "service-subnet"
      address_prefix = "10.0.3.0/24"
    },
    {
      name    = "web-subnet"
      address_prefix = "10.0.4.0/24"
    }
  ]
