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

variable "tg_port" {
  description = "Port of the target group"
}

variable "vpc_id" {
  description = "VPC Id of the target group"
}