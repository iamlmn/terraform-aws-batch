# High-Throughput Batch Computing on AWS.
IaC setup for high-throutput-batch-workflow setup in AWS using Batch written in terrraform.

<img src="https://logodix.com/logo/1686050.png" height="128" width="128"> ![terraformm version](https://img.shields.io/badge/terraform-v0.12.28-purple)

### Code
Code was written in HashiCorp Language(HCL) with terraform v0.12.28.

## Summary of set up
### Get terraform
```shell
wget https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_linux_amd64.zip
unzip terraform_0.12.28_linux_amd64.zip
mv terraform /usr/local/bin/
```
or 
```shell
brew install terraform # OS X 
```


### module definition
```
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
```

### Prerequisites
 - VPC default/ custom should be already present.
 - ECR & docker image should be already present

## INPUTS
1. "$ENVIRONMENT" : Staging name - [dev, uat, prod]
2. "$REGION" : AWS region where you want the resources to be deployed.
3. "$NAME_TAG" : Service name - PredictonPipeline here.
4. "$APP_TAG" : Application that uses this service - Breed.

## OUTPUTS

### Contributors
 - [Lakshmi Naarayanan](https://github.com/iamlmn) 