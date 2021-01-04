variable number_example {
  type        = number
  description = "An example for number variable in terraform"
  default     = 35
}
variable list_example {
  type        = list
  description = "An example for list variable in terraform"
  default     = ["a", 2, "c", 4]
}
variable list_example_numberic {
  type        = list(number)
  description = "An example for list variable of numeric in terraform"
  default     = [1, 2, 3, 4]
}
variable map_example {
  type        = map(string)
  description = "An example of map in terraform"
  default = {
    "key1" = "Value1",
    "key2" = "Value2",
    "key3" = "Value3",
  }
}
variable object_example {
  type = object({
    name    = string
    age     = number
    tags    = list(string)
    enabled = bool
  })
  description = "An example of structural type in terraform"
  default = {
    name    = "object_Value1"
    age     = 42
    tags    = ["a_object", "b", "c"]
    enabled = true
  }
}
variable sens_example {
  type        = string
  default     = "secretext"
  description = "Terraform wont output the value of this variable since we use sensitive while declaring the type"
}
# declaring condition in variable that it should always start with (rg-) if not it will throw error
variable "rg_name" {
  type        = string
  description = "The name of the Azure Resource Group."
  default     = "rg-frontend_app"

  validation {
    condition = length(var.rg_name) > 3 && substr(var.rg_name, 0, 3) == "rg-"
    # condition     = can(regex("^rg-", var.rg_name))
    error_message = "The rg_name value must be valid, starting with \"rg-\"."
  }
}
