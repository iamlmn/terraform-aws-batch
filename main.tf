/*
Terraform version : v0.12.26
Service: AWS Batch Pipeline
Author  : lakshminaarayananvs@rediffmail.com
*/


provider "aws" {
  region = var.region
}

locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Name         = var.Name
    Owner        = "lmn"
    Provisioner  = "Terraform"
    Application  = var.Application
    Department   = "Developers"
    Contact      = "lakshminaarayananvs@rediffmail.com"
    Stack        = "Development"
    Deployer_IAM = "${data.aws_caller_identity.current.arn}"
  }

  # env Variables mappings used by Lambda & compute environments
  env = {
    env_name           = "dev"
    subnets            = var.ce_subnets
    security_group_ids = var.ce_security_groups
  }
}


###################################################
# ~~~~~~~~~~ BATCH ~~~~~~~~~~~#
###################################################

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

# job queue
module "pipeline-job_queue" {
  source                   = "./modules/job_queue"
  job_queue_name           = "${var.Name}-${terraform.workspace}"
  job_queue_priority       = var.job_queue_priority
  compute_environment_list = ["${var.Name}-MyComputeEnvironment"]

  # tags
  resource_tags = local.common_tags
  jq_depends_on = [module.compute_environment.name]
  # depends_on = ["module.compute_environment.name"] # this is not supported currently (0.12.26) but is expected to work fromm 0.13

}
#jd
module "my_job_definition" {
  source              = "./modules/job_definition"
  service_name        = "${var.Name}"
  jd_command          = var.job_command      # ["python", "/home/analysis/run.py", "Ref::s3_uri"]
  docker_ecr_link     = var.docker_repo_name # "Modelling-pipeline-docker:PrPCodeBuild"
  jd_memory           = var.jd_memory        # 1024
  jd_vcpus            = var.jd_vcpus         # 2
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
