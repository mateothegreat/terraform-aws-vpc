output "vpc" {

    value = aws_vpc.this

}

output "public_subnets" {

    value = aws_subnet.public

}

output "private_subnets" {

    value = aws_subnet.private

}

output "public_route_table_id" {

    value = aws_route_table.public.id

}

output "private_route_table_id" {

    value = aws_vpc.this.default_route_table_id

}
