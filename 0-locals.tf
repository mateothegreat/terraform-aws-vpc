locals {

    public_subnets  = [ for subnet in var.subnets : subnet if subnet.visibility == "public" ]
    private_subnets = [ for subnet in var.subnets : subnet if subnet.visibility == "private" ]

}
