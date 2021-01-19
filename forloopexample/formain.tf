# Transforming a list into another list
# Transforming a list into a map

locals {

  arr     = ["host1", "host2", "host3"]
  arr_num = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
}
# Terraform lists can also be filtered by adding an if in the for expression:
