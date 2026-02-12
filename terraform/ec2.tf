# -----------------------------
# Amazon Linux AMI
# -----------------------------
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# -----------------------------
# Bastion EC2 Instance
# -----------------------------
resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.bastion_us.id]
  associate_public_ip_address = true

  key_name = "1056-us" # <-- CHANGE THIS

  tags = {
    Name = "dipak-bastion-server"
  }
}
