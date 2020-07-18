# High-Throughput (Genomics) Batch Workflows on AWS Infrastructure.

IaC setup for high-throutput-batch-workflow setup in AWS using Batch written in terrraform.
### Code
Code was written in HashiCorp Language(HCL) with terraform v0.12.28.
### CI/CD
Currently CI/CD is not setup.
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
### Prerequisites
 - Assumes the backed s3 bucket "bh-platform-terraform-"$ENVIRONMENT"" is present.
 - AWS creds configured with access to bhb-users s3 bucket / an to be able to assume roles from respective environments.
 - VPC default/ custom should be already present.
 - ECR & docker image should be already present.

## How to run tests
 Plan is to have tests for all src lambdas. Not setup yet.
#### Deployment instructions 
deploy.sh does all the work for you.
```
chmod +x ./deploy.sh
bash deploy.sh "$ENVIRONMENT" "$REGION" "$NAME_TAG" "$APP_TAG"
```
1. "$ENVIRONMENT" : Staging name - [dev, uat, prod]
2. "$REGION" : AWS region where you want the resources to be deployed.
3. "$NAME_TAG" : Service name - PredictonPipeline here.
4. "$APP_TAG" : Application that uses this service - Breed.

#### Destruction
Run the destroy.sh in bash, it automaticlly removes all the resources created.
```shell
chmod +x ./deploy.sh
bash deploy.sh "$ENVIRONMENT" "$REGION" "$NAME_TAG" "$APP_TAG"
```
### Contributors
 - [Lakshmi Naarayanan](https://github.com/iamlmn) 