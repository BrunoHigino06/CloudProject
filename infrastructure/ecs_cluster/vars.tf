#ECS Cluster vars
#Cluster vars
variable "MainCluster" {
    type = map(any)
        default = {
            name  = ""
            environment = ""
            settingname = ""
            settingvalue = ""
        }

    description = "Variables for the ECS cluster"
}