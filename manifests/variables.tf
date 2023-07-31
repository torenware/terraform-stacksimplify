variable "aws_region" {
  default     = "us-east-1"
  description = "Region for tutorial"
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t3.micro"
}

# Keypair must already exist in region.
variable "instance_keypair" {
  description = "AWS keypair in region for  ec2 instance"
  type        = string
  default     = "terraform-key"
}
