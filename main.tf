# Providers
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
}

# Instance in us-east-1
resource "aws_instance" "intance01" {
  ami           = "ami-068c0051b15cdb816"
  instance_type = "t2.micro"
  count = "3"

  provider = aws.us-east-1

  tags = {
    Name = "instance-east-${count.index + 1}"
  }
}

# Instance in us-west-2
resource "aws_instance" "intance02" {
  ami           = "ami-0ebf411a80b6b22cb"
  instance_type = "t2.micro"
  count = "2"

  provider = aws.us-west-2

  tags = {
    Name = "instance-west-${count.index + 1}"
  }
}
