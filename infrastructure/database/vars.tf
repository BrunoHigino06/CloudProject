#Database vars
#Secrets vars
#Db password secret vars
variable "dbPasswordSecret" {
    type = map(any)
        default = {
            name  = ""
            type = ""
            Environment = ""
        }

    description = "SSM Secret for the database password"
}

#Db username secret vars
variable "dbusernameSecret" {
    type = map(any)
        default = {
            name  = ""
            type = ""
            Environment = "SSM Secret for the database username"
        }

    description = ""
}

#Database instance vars
variable "blogDB" {
    type = map(any)
        default = {
            allocated_storage  = ""
            db_name = ""
            engine = ""
            engine_version = ""
            instance_class = ""
            parameter_group_name = ""
            storage_type = ""
            identifier = ""
            Name = ""
            Environment = ""
        }

    description = "Database configurations"
}