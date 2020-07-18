# Job queue module

### module definition
```
module "batch-job_queue" {
  source                   = "./modules/job_queue"
  job_queue_name           = "${var.Name}-${terraform.workspace}"
  job_queue_priority       = var.job_queue_priority
  compute_environment_list = ["${var.Name}-MyComputeEnvironment"]

  # tags
  resource_tags = local.common_tags
  jq_depends_on = [module.compute_environment.name]
  # depends_on = ["module.compute_environment.name"] # this is not supported currently (0.12.26) but is expected to work fromm 0.13

}
```

### Prerequisites
 - VPC default/ custom should be already present.
 - ECR & docker image should be already present
