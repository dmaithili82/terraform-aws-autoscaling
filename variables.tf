variable "project_name" { default = "maddy" }
variable "key_name" { default = "sec_key" } # must exist in EC2 Key Pairs
variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "public_subnets" { default = ["10.0.1.0/24", "10.0.2.0/24"] }
variable "private_subnets" { default = ["10.0.3.0/24", "10.0.4.0/24"] }
variable "instance_type" { default = "t2.micro" } # free-tier friendly
variable "health_check_path" { default = "/" }
