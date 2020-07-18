#############################
# 		Job-Queue  			#
#############################

resource "aws_batch_job_queue" "job_queue" {
  name                 = var.job_queue_name
  state                = "ENABLED"
  priority             = var.job_queue_priority
  compute_environments = var.compute_environment_list
  depends_on           = [var.jq_depends_on]
}


