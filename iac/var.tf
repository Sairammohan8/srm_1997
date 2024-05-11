# var.tf

# Define variables
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-west-2"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "availability_zone" {
  description = "The AWS availability zone to deploy resources in"
  type        = string
  default     = "us-west-2a"
}

variable "ssh_key_name" {
  description = "The name of the SSH key pair to use for EC2 instances"
  type        = string
  default     = "my-key-pair"
}

# Add more variables as needed for your project
