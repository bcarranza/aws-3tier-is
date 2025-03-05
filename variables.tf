# environment vars
#---------------------------------------
variable "environment" {
  type    = string
  default = "Dev"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "app_name" {
  type        = string
  description = "app name prefix for naming"
  default     = "umgis2025"
}

# vpc vars
#----------------------------------------
variable "vpc_cidr" {
  type        = string
  description = "VPC cidr block"
  default     = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "enable dns hostnames"
  default     = true
}

# common cidrs
#----------------------------------------
variable "all_traffic" {
  type        = string
  description = "all all traffic"
  default     = "0.0.0.0/0"
}

variable "NAT_subnet" {
  type        = string
  description = "subnet location for NAT"
  default     = "us"
}

# private subnet vars
#----------------------------------------
variable "private_subnets" {
  default = {
    "private-subnet-1" = 0
    "private-subnet-2" = 1
  }
}

# public subnet vars
#----------------------------------------
variable "public_subnets" {
  default = {
    "public-subnet-1" = 0
    "public-subnet-2" = 1
  }
}
variable "auto_ipv4" {
  type        = bool
  description = "enable auto-assign ipv4"
  default     = true
}

# security group vars
#----------------------------------------
variable "ssh_sg" {
  type        = map(any)
  description = "ssh security group vars "
  default = {
    "cidr_block"            = "0.0.0.0/0"
    "create_before_destroy" = true
    "timeout_delete"        = "2m"
  }
}


# ec2 vars
#----------------------------------------
variable "bastion" {
  type    = string
  default = "bastion"
}
variable "bastion_ami" {
  type        = string
  description = "Instance AMI: Ubuntu 22.04"
  default     = "ami-04b70fa74e45c3917"
}
variable "bastion_type" {
  type    = string
  default = "t2.micro"
}

variable "key_pair" {
  type        = string
  description = "ec2 key pair"
  default     = "bastion_key"
}
