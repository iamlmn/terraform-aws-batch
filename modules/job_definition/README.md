# Job definition module

### module definition
```
module "my_job_definition" {
  source              = "./modules/job_definition"
  service_name        = "${var.Name}"
  jd_command          = var.job_command
  docker_ecr_link     = var.docker_repo_name
  jd_memory           = var.jd_memory
  jd_vcpus            = var.jd_vcpus
  job_definition_name = "${var.Name}-{var.job_definition_name}-${terraform.workspace}"
  iam_task_policy_actions = [
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

  iam_task_policy_resources = "*"


  # tags
  resource_tags = local.common_tags
}
```

### Prerequisites
 - ECR & docker image should be already present
