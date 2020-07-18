# Compute environment module

### module definition
```
module "compute_environment" {
  source                   = "./modules/compute_environment"
  service_name             = "${var.Name}"
  compute_environment_name = "${var.Name}-MyComputeEnvironment"
  instance_type            = var.instance_type # ["optimal", ]
  maxvcpus                 = var.maxvcpus
  minvcpus                 = var.minvcpus
  ce_security_groups       = local.env.security_group_ids
  ce_subnets               = local.env.subnets
  environment              = local.env.env_name

  # tags
  resource_tags = local.common_tags
}
```

### Prerequisites
 - VPC default/ custom should be already present.
 - ECR & docker image should be already present
