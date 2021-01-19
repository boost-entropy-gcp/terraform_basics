# Transforming a list into another list
output "test" {
  value = [for s in local.arr : upper(s)]
}
# Printing the output value of number its above 5
output "test_num" {
  value = [for num in local.arr_num : num if num > 5]
}
# Transforming a list into a map
# See for map we are using { } otheriwse it wont output the desired result
output "test_map" {
  value = { for val in local.arr : val => upper(val) }
}
#  Transforming a map into a list
output "test_map_lst" {
  value = [for v in values(var.mymap) : v["id"]]
}
output "test_map_v" {
  value = { for k, v in var.mymap : k => v["id"] }
}
