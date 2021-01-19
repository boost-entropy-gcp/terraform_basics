variable "environment" {
  default = {
    "test" = "us-east-1"
    "prod" = "us-west-2"
  }
}

variable "availzone" {
  description = "Availability Zones Mapping"
  default = {
    "us-east-1" = "us-east-1a,us-east-1b,us-east-1c"
    "us-west-2" = "us-west-2a,us-west-2b,us-east-1c"
  }
}

# To capture one AZ, first use the lookup()function to get the list of comma-separated values, and then split it with a comma ( ,) 
# and the split() function. 
# Finally, use the element() function to capture the defined index of choice. This will return an AZ as a string

output "availabiltyzones" {
  value = element(split(",", lookup(var.availzone, var.environment.prod)), 1)
}
