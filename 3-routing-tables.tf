resource "aws_route_table" "public" {

    vpc_id = aws_vpc.this.id

    tags = {

        Name = "${ var.name }-public"

    }

}

resource "aws_route" "nat" {

    count = var.enable_nat_gateway ? 1 : 0

    route_table_id         = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id         = aws_nat_gateway.this[ 0 ].id

}

resource "aws_default_route_table" "this" {

    count = var.enable_nat_gateway ? 1 : 0

    default_route_table_id = aws_vpc.this.default_route_table_id

    tags = {

        Name = "${ var.name }-private"

    }

}

resource "aws_route" "igw" {

    route_table_id         = aws_vpc.this.default_route_table_id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.this.id

}
