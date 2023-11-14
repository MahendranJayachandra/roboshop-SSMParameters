# create ssm parameters in AWS management console
# I am not able to access the object values through count.
resource "aws_ssm_parameter" "ssmparams" {
  #count = length(var.paramlists)
  for_each = var.paramlists
  name  = var.paramlists[each.key].name //can also use each.value["name"]
  type  = var.paramlists[each.key].type
  value = var.paramlists[each.key].val
}

variable "paramlists" {
    default = { 
        catalogue = { name = "/roboshop/dev/frontend/catalogue-dev", type = "String", val = "http://catalogue-dev.learnskill.fun:8080/"},
        user = { name = "/roboshop/dev/frontend/user-dev", type = "String", val = "http://user-dev.learnskill.fun:8080/" },
        shipping = { name = "/roboshop/dev/frontend/shipping-dev", type = "String", val = "http://shipping-dev.learnskill.fun:8080/" },
        payment = { name = "/roboshop/dev/frontend/payment-dev", type = "String", val = "http://payment-dev.learnskill.fun:8080/" }
    }
}

# output "printvalue" {
#  value = var.paramlists["catalogue"].name
#}
# aws ssm describe-parameters | jq '.Parameters[].Name' | sed 's/"//g' > /tmp/ssm.txt
# Get the list of all names of AWS SSM parameters.Remove double quotes from the list of all names.
# store the list of all ssm parameter names in the file ssm.txt

//for i in `cat /tmp/ssm.txt`; do echo $i; aws ssm delete-parameter --name $i; done;
# delete the ssm parameters listed in the file ssm.txt. "file location" used in for loop consists
# of the special character "`".In the keyboard,This character is present along with the "~" symbol.

