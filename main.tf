
provider "aws" {
  region = "ap-south-1"  
  access_key = "AKIAXCUBNKDNSTLXLOFW"
  secret_key = "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"
}

resource "aws_vpc" "nik_vpc" {
  cidr_block = "10.0.0.0/16"
  
}

resource "aws_subnet" "nik_subnet" {
  vpc_id     = aws_vpc.nik_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "nik-subnet"
  }
}

resource "aws_instance" "nik_ec2_instance" {
  ami           = "ami-0287a05f0ef0e9d9a"  
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.nik_subnet.id
  

  tags = {
    Name = "nik_instance"
  }
}



