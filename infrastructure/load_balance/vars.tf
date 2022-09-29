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