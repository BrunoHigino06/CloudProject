#Load balance Comum configuration vars
variable "protocol" {
  type = list(string)
  description = "Types of protocols used on the load balance"
}

variable "port" {
  type = list(string)
  description = "Ports of protocols used on the load balance"
}

#Load balance Comum Tag vars
variable "Environment" {
  description = "Default tag for define the environment"
}

#Load balance vars
variable "lb_name" {
  description = "Name of the load balance"
}

variable "lb_type" {
  description = "Type of the load balance"
}

variable "lb_sg" {
  description = "Security group used on the load balance"
}

variable "lb_subnets" {
  description = "Security group used on the load balance"
}

#Target group vars
variable "tg_name" {
  description = "Name of the target group"
}

variable "target_type" {
  description = "Type of the target group"
}

variable "vpc_id" {
  description = "VPC Id of the target group"
}

#Public certificate vars
variable "domain_name" {
  description = "Domain name of the public certificate"
}

variable "validation_method" {
  description = "Type of validation for the certificate"
}

#Route53 vars
#Route53 records
variable "CertificateRecord" {
    type = map(any)
        default = {
            zone_id  = ""
            type = ""
            ttl  = ""

        }
}