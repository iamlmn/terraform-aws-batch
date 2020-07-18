
output "job_queue_arn" {
  value = module.pipeline-job_queue.arn
}

output "compute_environment_name" {
  value = module.compute_environment.name
}

output "job_definition_name" {
  value = module.my_job_definition.name
}

output "job_definition_arn" {
  value = module.my_job_definition.arn
}