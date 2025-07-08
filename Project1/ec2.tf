resource "aws_instance" "proec2" {
  ami = var.aws_ami_id
  instance_type = var.aws_instance_type

  tags = {
    despriction="This is a ec2 for project 1"
    name="myproj_aws_ec2"
  }
}