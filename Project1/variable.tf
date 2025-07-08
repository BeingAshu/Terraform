variable "aws_ami_id" {
  type=string
  default= "ami-0d1b5a8c13042c939" #ubuntu
  description = "This is variable for aws instance ami"
}

variable "aws_instance_type" {
   type=string
   default = "t2.micro"
   description = "This is variable for aws intance type"
}

variable "s3bucket" {
  type=string
}