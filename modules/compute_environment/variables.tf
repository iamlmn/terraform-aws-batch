
variable "service_name" {
  description = "Service/Pipeline name"
}

#########################################
# Batch  - Comput Environmnet Varialbes #
#########################################

variable "compute_environment_name" {
  description = "The name of the compute environment function"
}

variable "aws_batch_service_role-pp" {
  description = "The aws_batch_service_role name"
  default     = "aws_batch_service_role"
}

variable "ecsInstanceRole-pp" {
  description = "The ecsInstanceRole name"
  default     = "ecs_instance_role"
}

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

variable "environment" {
  description = "ENVIRONMENT"
  default     = "dev"
}



###################
# tags variables ##
###################

variable "resource_tags" {
  description = "Custom tags to set on all the resources"
  type        = map(string)
}
