output "to_list" {
  value = [for k, v in tolist(["a", "b", "c"]) : { key = k, value = v }]
}

# Outputs:

# to_list = [
#   {
#     "key" = 0
#     "value" = "a"
#   },
#   {
#     "key" = 1
#     "value" = "b"
#   },
#   {
#     "key" = 2
#     "value" = "c"
#   },
# ]

output "to_map" {
  value = [for k, v in tomap({ foo = "a", bar = "b", baz = "c" }) : { key = k, value = v }]
}

# to_map = [
#   {
#     "key" = "bar"
#     "value" = "b"
#   },
#   {
#     "key" = "baz"
#     "value" = "c"
#   },
#   {
#     "key" = "foo"
#     "value" = "a"
#   },
# ]

output "to_set" {
  value = [for k, v in toset(["a", "b", "c"]) : { key = k, value = v }]
}
# to_set = [
#   {
#     "key" = "a"
#     "value" = "a"
#   },
#   {
#     "key" = "b"
#     "value" = "b"
#   },
#   {
#     "key" = "c"
#     "value" = "c"
#   },
# ]
