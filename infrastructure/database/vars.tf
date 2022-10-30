#Database vars
#Secrets vars
variable "dbPasswordSecret" {
    type = map(any)
        default = {
            name  = ""
            type = ""
            value = ""
            Environment = ""
        }

    description = "Variables for the main service blogmain repository"
}