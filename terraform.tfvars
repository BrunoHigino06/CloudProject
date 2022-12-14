#Network module inputs
#VPC inputs
vpc = {
  name = "CloudProject"
  Network_CIDR = "10.0.0.0/16"
}

# Internet Gateway inputs
IGW_name = "IGW"

# Internet Gateway inputs
NatGw_name = "NatGw"

#Subnet inputs
subnets_names      = ["Alb1", "Alb2", "Frontend1", "Frontend2", "Db1", "Db2"]
subnets_cidr_block = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
subnet_az          = ["us-east-1a", "us-east-1b", "us-east-1a", "us-east-1b", "us-east-1a", "us-east-1b"]

#Route table inputs
rt_names = ["ALBRT", "FrontendRT", "DBRT"]

#Route table inputs association
subnet_name_association = ["Alb1", "Alb2", "Frontend1", "Frontend2", "Db1", "Db2"]
route_table_name_association = ["ALBRT", "ALBRT", "FrontendRT", "FrontendRT", "DBRT", "DBRT"]

#Network ACL inputs
network_acl_name = ["PublicACL", "PrivateACL"]

#Public ACL's rules inputs (ingress first)
PublicACL_rule_number = ["100", "100"]
PublicACL_egress = ["false", "true"]
PublicACL_protocol = ["tcp", "-1"]
PublicACL_rule_action = ["allow", "allow"]
PublicACL_cidr_block = ["0.0.0.0/0", "0.0.0.0/0"]
PublicACL_from_port = ["80", "0"]
PublicACL_to_port = ["80", "65535"]

#Private ACL's rules inputs (ingress first)
PrivateACL_rule_number = ["100","101", "100"]
PrivateACL_egress = ["false", "false", "true"]
PrivateACL_protocol = ["tcp", "tcp", "-1"]
PrivateACL_rule_action = ["allow", "allow", "allow"]
PrivateACL_cidr_block = ["10.0.1.0/24", "10.0.2.0/24", "0.0.0.0/0"]
PrivateACL_from_port = ["0", "0", "0"]
PrivateACL_to_port = ["65535", "65535", "65535"]

#Security groups vars
sg_names = ["ALBSG", "FrontendSG", "DBSG"]

#Security groups rules inputs
#ALBSG rules inputs
#ALBSG Ingress inputs
ALBSGIngress_from_port = ["80"]
ALBSGIngress_to_port = ["80"]
ALBSGIngress_protocol = ["tcp"]
ALBSGIngress_cidr_blocks = ["0.0.0.0/0"]

#ALBSG Egress inputs
ALBSGEgress_from_port = ["0"]
ALBSGEgress_to_port = ["65535"]
ALBSGEgress_protocol = ["tcp"]
ALBSGEgress_cidr_blocks = ["0.0.0.0/0"]

#FrontendSG rules inputs
#FrontendSG Ingress
FrontendSGIngress_from_port = ["80", "80", "3306", "3306"]
FrontendSGIngress_to_port = ["80", "80", "3306", "3306"]
FrontendSGIngress_protocol = ["tcp", "tcp", "tcp", "tcp"]
FrontendSGIngress_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24", "10.0.5.0/24", "10.0.6.0/24"]

#FrontendSG Egress
FrontendSGEgress_from_port = ["0"]
FrontendSGEgress_to_port = ["65535"]
FrontendSGEgress_protocol = ["tcp"]
FrontendSGEgress_cidr_blocks = ["0.0.0.0/0"]

#DBSG rules inputs
#DBSG Ingress
DBSGIngress_from_port = ["3306", "3306"]
DBSGIngress_to_port = ["3306", "3306"]
DBSGIngress_protocol = ["tcp", "tcp"]
DBSGIngress_cidr_blocks = ["10.0.3.0/24", "10.0.4.0/24"]

#DBSG Egress
DBSGEgress_from_port = ["0"]
DBSGEgress_to_port = ["65535"]
DBSGEgress_protocol = ["tcp"]
DBSGEgress_cidr_blocks = ["0.0.0.0/0"]

#Infrastructure inputs
#Comum configuration inputs
protocol = ["HTTP", "HTTPS"]
port = ["80", "443"]

#Load balance comum Tag inputs
Environment = "production"


#Load balance inputs
lb_name = "FrontEndlb"
lb_type = "application"

#Target group inputs
tg_name = "BlogTG"
target_type = "ip"

#Public certificate inputs
validation_method = "DNS"

#Route53 inputs
#Route53 records inputs
CertificateRecord = {
      ttl = 5
    }


#ECS inputs
#Cluter inputs
MainCluster = {
  name = "CloudProject"
  settingname = "containerInsights"
  settingvalue = "disabled"
}

#Database inputs
#Secret inputs
#DB Password Inputs
dbPasswordSecret = {
  name = "blogdb_password"
  type = "String"
}

#DB username Inputs
dbusernameSecret = {
  name = "blogdb_username"
  type = "String"
}

#Database instance vars
blogDB = {
  allocated_storage = 10
  db_name = "blogdb"
  engine = "mysql"
  engine_version = "8.0.30"
  instance_class = "db.t3.micro"
  parameter_group_name = "default.mysql8.0"
  storage_type = "gp2"
}

#Repository inputs
BlogmainRepo = {
  name = "blogmain"
}