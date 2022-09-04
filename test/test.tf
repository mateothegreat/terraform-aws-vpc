provider "aws" {

    profile = "nvrai"
    region  = "us-east-1"

}

module "test" {

    source = "../"

    name               = "test-1"
    cidr               = "123.0.0.0/16"
    enable_nat_gateway = true

    subnets = [

        {

            availability_zone = "us-east-1a"
            cidr              = "123.0.1.0/24"
            visibility        = "public"

        }, {

            availability_zone = "us-east-1b"
            cidr              = "123.0.2.0/24"
            visibility        = "public"

        }, {

            availability_zone = "us-east-1a"
            cidr              = "123.0.10.0/24"
            visibility        = "private"

        }, {

            availability_zone = "us-east-1b"
            cidr              = "123.0.11.0/24"
            visibility        = "private"

        }, {

            availability_zone = "us-east-1c"
            cidr              = "123.0.12.0/24"
            visibility        = "private"

        }

    ]

}
