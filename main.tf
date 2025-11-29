provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "static-web-sg" {
  name = "static-web-sg"
  description = "Allow HTTP and HTTPS traffic"
  ingress  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "Myweb" {
  ami           = "ami-0ecb62995f68bb549"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.static-web-sg.id]
  key_name = "terraformkey"
  user_data = file("data.sh")
  tags = {
    Name = "static-web-server"
  }  
 }