resource "aws_instance" "demo_instance" {
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"

  tags = {
    name = "Terraform_EC2"
  }
}
