resource "aws_security_group" "vpc-ssh" {
  name        = "vpc-ssh"
  description = "Dev SG for ssh"

  # We use the default VPC, so we do not
  # need to define vpc_id
  #vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # allow from everywhere since this is
    # our first pass. Caveat engineer!
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description      = "Outgoing ssh to everywhere."
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "vpc-ssh"
  }
}


resource "aws_security_group" "vpc-web" {
  name        = "vpc-web"
  description = "Dev SG for web access"

  # We use the default VPC, so we do not
  # need to define vpc_id
  #vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow http access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # allow from everywhere since this is
    # our first pass. Caveat engineer!
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow https access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    # allow from everywhere since this is
    # our first pass. Caveat engineer!
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outgoing ssh to everywhere."
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc-web"
  }
}
