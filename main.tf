# create ssm parameters in AWS management console

resource "aws_ssm_parameter" "ssmparams" {
  count = length(var.paramlists)
  name  = var.paramlists[count.index].name
  type  = var.paramlists[count.index].type
  value = var.paramlists[count.index].value
}

variable "paramlists" {
    default = { 
        catalogue = { name = "roboshop/dev/frontend/catalogue-dev", type = "String", value = "http://catalogue-dev.learnskill.fun:8080/"},
        user = { name = "roboshop/dev/frontend/user-dev", type = "String", value = "http://user-dev.learnskill.fun:8080/" },
        shipping = { name = "roboshop/dev/frontend/shipping-dev", type = "String", value = "http://shipping-dev.learnskill.fun:8080/" },
        payment = { name = "roboshop/dev/frontend/payment-dev", type = "String", value = "http://payment-dev.learnskill.fun:8080/" }
    }
}

