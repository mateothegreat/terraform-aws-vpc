resource "aws_internet_gateway" "this" {

    vpc_id = aws_vpc.this.id

    tags = {

        Name = var.name

    }

}

resource "aws_eip" "nat" {

    count = var.enable_nat_gateway ? 1 : 0

    vpc = true

    tags = {

        Name = "${ var.name }-nat-1"

    }

}

resource "aws_nat_gateway" "this" {

    count = var.enable_nat_gateway ? 1 : 0

    allocation_id = aws_eip.nat[ 0 ].id
    subnet_id     = aws_subnet.public[ 0 ].id

    tags = {

        Name = var.name

    }

}
