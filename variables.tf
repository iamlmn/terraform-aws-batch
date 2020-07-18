# General Variables

data "aws_caller_identity" "current" {}

variable "Application" {
  description = "Name of the Application which consumes this service"
}
variable "Name" {
  description = "Name of the service/pipeline"
}

#variable "Owner" {
#  description = "Service/Team Owner name"
#}

variable "region" {
  description = "Project name for tags and resource naming"
  default     = "us-east-1"
}

# VPC Setting
variable "vpc_config" {
  default     = null
  description = "Provide this to allow your function to access your VPC. Fields documented below. See Lambda in VPC."
  type = object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })
}

