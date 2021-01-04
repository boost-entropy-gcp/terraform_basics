# generate a random character set to append to resource names to make them unique
# This configures the string to have a length of five and no special or uppercase
resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

# The random_id resource can be used to generate ids that can be used for naming resources
# output is interesting for this resource as it provides a base64, base64 URL, hex, and decimal options 
# along with just the id
resource "random_id" "my_id" {
  byte_length = 8
}
# It creates a random integer between the defined min and max
resource "random_integer" "my_integer" {
  min = 1
  max = 100
}

#If you have used Docker or Helm and noticed you get the randomly generated names, now you can do this with Terraform. 
# The length is interesting as it determines the number of adjectives that get added to the name.
resource "random_pet" "my_name" {
  length = 2
}

# This resource shuffles a list of inputs and can return the whole list or a subset of that list 
# with the items not in the original order
resource "random_shuffle" "my_numbers" {
  input = ["one", "two", "three", "four"]
}
# The random_password resource is similar to the random_string except it hides the output from the console.
# While the password is hidden in the console output, you can still get the value as an output variable.
resource "random_password" "my_password" {
  length  = 12
  special = true
}
