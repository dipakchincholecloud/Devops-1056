# -----------------------------
# Bastion Security Group
# -----------------------------
resource "aws_security_group" "bastion_us" {
  name        = "dipak-bastion-us"
  description = "Allow SSH from anywhere"
  vpc_id      = aws_vpc.this.id

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dipak-bastion-us"
  }
}
