output "public_subnets" {

    value = aws_subnet.public

}

output "private_subnets" {

    value = aws_subnet.private

}

output "a" {
    value = var.subnets
}
