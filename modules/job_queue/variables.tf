#################
# Job Queues   ##
#################

variable "job_queue_name" {
  description = "The name of the compute environment function"
  default     = "MyPipelineQueue"
}

variable "job_queue_priority" {
  description = "The job queue priority"
  default     = 1
}

variable "compute_environment_list" {
  description = "The of compute environment to attach"
  type        = list(string)
}

variable "jq_depends_on" {
  type    = any
  default = null
}


###################
# tags variables ##
###################

variable "resource_tags" {
  description = "Custom tags to set on all the resources"
  type        = map(string)
}
