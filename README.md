# High-Throughput Batch Computing on AWS.
IaC setup for high-throutput-batch-workflow setup in AWS using Batch written in terrraform.

<img src="https://logodix.com/logo/1686050.png" height="32" width="32"> ![terraform version](https://img.shields.io/badge/terraform-v0.12.28-purple)

## Set up
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

### Batch module usage
Configure AWS Batch with just ~15lines of configs.
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

Individual sub-modules can also be used directly
Refer to their respective readme for usages.
- [ Batch Compute Environment](https://github.com/iamlmn/terraform-aws-batch/blob/master/modules/compute_environment/README.md) 
- [Batch Job definition](https://github.com/iamlmn/terraform-aws-batch/blob/master/modules/job_definition/README.md)  
- [Batch Job queue](https://github.com/iamlmn/terraform-aws-batch/blob/master/modules/job_queue/README.md) 


## Requirements
| Name | Version |
|------|---------|
| terraform | ~> 0.12.6 |
| aws | ~> 2.49 |

### Prerequisites
 - VPC default/ custom should be already present.
 - ECR & docker image should be already present


| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| Application | The instance_type for compute environment to use | `string` | n/a | yes |
| ce_security_groups | The ce_security_groups | `list(string)` | `true` | yes |
| ce_subnets | The ce_subnets | `list(string)` | `true` | yes |
| docker_repo_name | The name of the job definitions | `string` | `true` | yes |
| Name | Name of the service/pipeline | `string` | `true` | yes |
| instance_type | The ce_subnets | `list(string)` | `false` | no |
| jd_memory | Batch job definition memory | `string` | `true` | no |
| jd_vcpus | VCPUs required by the job definition | `string` | `true` | no |
| job_command | Job definition command | `list` | `true` | no |
| job_queue_name | The name of the job queue | `string` | `true` | no |
| job_queue_priority | Job definition command | `string` | `true` | no |
| maxvcpus | Max allowed Vcpus to be spun up by compute environment | `string` | `true` | no |
| minvcpus | Min allowed Vcpus to be spun up by compute environment | `string` | `true` | no |
| region | AWS availability zone/region | `string` | `true` | no |


## Outputs
| Name | Description |
|------|-------------|
| job_queue_arn | The ARN of the Batch Job queue created |
| job_definition_arn | The ARN of the Batch Job definition created |
| job_definition_name | The Name of the Batch Job definition created |
| job_queue_arn | The ARN of the Batch Job queue |

### Planned work/ TODOs :
 - [x] Base Batch module. 
 - [x] Basic Batch submodule.
 - [x] Register as Terraform module.
 - [ ] Alpha Test and fix Readme usage definitions.
 - [ ] Generalize more with all possible configs.
 - [ ] Better variable description and documentation. 


### Author
 - [Lakshmi Naarayanan](https://github.com/iamlmn) 

### License
- [MIT License](https://github.com/iamlmn/terraform-aws-batch/blob/master/LICENSE)