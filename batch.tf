module "batch" {
  source      = "iamlmn/batch/aws"
  version     = "1.1.0"
  Name        = "${var.Name}"
  Application = "${var.Application}"

  # Compute environment
  instance_type      = "${var.instance_type}"
  maxvcpus           = "${var.maxvcpus}"
  minvcpus           = "${var.minvcpus}"
  ce_security_groups = "${var.ce_security_groups}"
  ce_subnets         = "${var.ce_subnets}"

  # job definitions
  job_definition_name = "${var.job_definition_name}"
  docker_repo_name    = "${var.docker_repo_name}"
  jd_memory           = "${var.jd_memory}"
  jd_vcpus            = "${var.jd_vcpus}"
  job_command         = "${var.job_command}"

  # job queues
  job_queue_name     = "${var.job_queue_name}"
  job_queue_priority = "${var.job_queue_priority}"


  region = "us-east-1"
}