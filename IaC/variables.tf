
variable "environment_name" {
  type = string  
}

variable "location" {
  type = string
  default = "westus"
}

variable "resource_group_name" {
  type = string
  description = "name of resource group"
  default = "demo-1"
}

variable "storage_account_name" {
  type = string
}

variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}


variable "tags" {

}

variable "subnets" {
  description = "vnet subnet"
}



# variable "require_name" {
#   type = bool
#   default = false
# }

# variable "age" {
#   type = number
#   default = 15
# }

# variable "age" {
#   type = list
#   default = ["15", "1"]
# }


# variable "tags" {
#   type = map
#   default = {
#     environment = dev
#     project = learning
#   }
# }

# variable "person" {
#   type = object
#   default = {
#     name = dev
#     age = 25
#     hobby = ["play", "music"],
#     additional = {
#       like_food = true
#       need_more = "no"
#     }
#   }
# }