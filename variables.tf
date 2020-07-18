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

/*
# VPC Setting
variable "vpc_config" {
  description = "Provide this to allow your function to access your VPC. Fields documented below. See Lambda in VPC."
  type = object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })
  default     = null
}
*/

# Batch variables


variable "instance_type" {
  description = "The instance_type for compute environment to use"
  type        = list(string)
  default     = ["optimal", ]
}

variable "maxvcpus" {
  description = "Max allowed Vcpus to be spun up by compute environment"
  default     = 16
}

variable "minvcpus" {
  description = "Min allowed Vcpus to be spun up by compute environment"
  default     = 0
}
variable "ce_security_groups" {
  description = "The ce_security_groups"
  type        = list(string)
}

variable "ce_subnets" {
  description = "The ce_subnets"
  type        = list(string)
}

# job_queue
variable "job_queue_name" {
  description = "The name of the compute environment function"
  default     = "MyPipelineQueue"
}

variable "job_queue_priority" {
  description = "The job queue priority"
  default     = 1
}

# job_def
variable "jd_vcpus" {
  description = "VCPUs required by the job definition"
  default     = 1
}

variable "jd_memory" {
  description = "Batch job definition memory"
  default     = 1024
}

variable "job_command" {
  description = "Job definition command"
  default     = ["ls", "-l"]
}

variable "job_definition_name" {
  description = "The name of the job definitions"
}

variable "docker_repo_name" {
  description = "The name of the job definitions"
}
