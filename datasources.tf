#Network module datasources
#Subnet datasources
#ALB Subnet datasource
data "aws_subnet" "Alb1" {
  filter {
    name   = "tag:Name"
    values = ["Alb1"]
  }
  depends_on = [
    module.network
  ]
}

data "aws_subnet" "Alb2" {
  filter {
    name   = "tag:Name"
    values = ["Alb2"]
  }
  depends_on = [
    module.network
  ]
}

#Security Groups datasources
#ALB Security Groups datasource
data "aws_security_group" "ALBSG" {
    filter {
        name   = "tag:Name"
        values = ["ALBSG"]
    }

    depends_on = [
      module.network
    ]
}

#Infrastructure modules datasources
#Load balance module datasources
data "aws_route53_zone" "main" {
  name         = "cmcloudlab633.info"
  private_zone = false
}