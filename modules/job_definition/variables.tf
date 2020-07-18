data "aws_caller_identity" "current" {}

variable "service_name" {
  description = "Service/Pipeline name"
}


###############################
# Job definitions Varialbes  ##
###############################

variable "jd_vcpus" {
  description = "VCPUs required by the job definition"
  default     = 1
}

variable "jd_memory" {
  description = "Batch job definition memory"
  default     = 1024
}

variable "jd_command" {
  description = "Job definition command"
}

variable "job_definition_name" {
  description = "The name of the job definitions"
}

variable "docker_ecr_link" {
  description = "The name of the job definitions"
}

variable "job_definition_container_properties" {
  description = "A valid container properties provide as a single valid JSON document. This parameters is required if the type parameter is container"
  default     = "./modules/batch/default_container_properties_dev.json"
}

variable "iam_task_policy_actions" {
  type = list(string)
  default = [
    "ec2:*",
    "logs:*",
    "ecs:*",
    "cloudwatch:*",
    "iam:GetInstanceProfile",
    "iam:GetRole",
    "autoscaling:*",
    "s3:*",
    "secretsmanager:*"
  ]
}

variable "iam_task_policy_resources" {
  default = []
}

###################
# tags variables ##
###################

variable "resource_tags" {
  description = "Custom tags to set on all the resources"
  type        = map(string)
}
