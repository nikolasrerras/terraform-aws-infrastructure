resource "aws_security_group" "web" {
  name        = "terraform-lab-web-sg"
  description = "Security group for Nginx web server"
  vpc_id      = var.vpc_id

  tags = {
    Name    = "terraform-lab-web-sg"
    Project = "terraform-aws-infrastructure"
  }
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.web.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  description = "Allow inbound HTTP traffic"
}

resource "aws_vpc_security_group_egress_rule" "all_ipv4" {
  security_group_id = aws_security_group.web.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  description = "Allow all outbound IPv4 traffic"
}
