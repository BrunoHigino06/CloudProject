#BlogMain Service vars
#BlogMainRepo vars
variable "BlogmainRepo" {
    type = map(any)
        default = {
            name  = ""
            Environment = ""
        }

    description = "Variables for the main service blogmain repository"
}