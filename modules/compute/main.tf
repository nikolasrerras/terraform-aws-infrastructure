data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "web" {
  ami           = data.aws_ssm_parameter.al2023_ami.value
  instance_type = var.instance_type

  subnet_id                   = var.public_subnet_id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  user_data = file("${path.module}/user-data.sh")

  credit_specification {
    cpu_credits = "standard"
  }

  metadata_options {
    http_tokens = "required"
  }

  depends_on = [
    aws_vpc_security_group_ingress_rule.http,
    aws_vpc_security_group_egress_rule.all_ipv4
  ]

  tags = {
    Name    = "terraform-lab-web"
    Project = "terraform-aws-infrastructure"
  }
}
