# create ssm parameters in AWS management console

resource "aws_ssm_parameter" "ssmparams" {
  #count = length(var.paramlists)
  for_each = var.paramlists
  name  = var.paramlists[each.key].name
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

output "printvalue" {
  value = var.paramlists["catalogue"].name
}