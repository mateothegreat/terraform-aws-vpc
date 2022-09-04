resource "aws_subnet" "public" {

    count = length(local.public_subnets)

    vpc_id            = aws_vpc.this.id
    cidr_block        = local.public_subnets[ count.index ].cidr
    availability_zone = local.public_subnets[ count.index ].availability_zone

    tags = {

        Name = "${ var.name }-${ local.public_subnets[ count.index ].visibility }-${ count.index + 1 }"

        visibility = local.public_subnets[ count.index ].visibility

    }

}

resource "aws_subnet" "private" {

    count = length(local.private_subnets)

    vpc_id            = aws_vpc.this.id
    cidr_block        = local.private_subnets[ count.index ].cidr
    availability_zone = local.private_subnets[ count.index ].availability_zone

    tags = {

        Name = "${ var.name }-${ local.private_subnets[ count.index ].visibility }-${ count.index + 1 }"

        visibility = local.private_subnets[ count.index ].visibility

    }

}
