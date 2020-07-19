#!/usr/bin/env bash

ENVIRONMENT=$1
REGION=$2
APPLICATION_TAG=$3
NAME_TAG=$4


terraform init
# terraform validate


if ! terraform workspace list 2>&1 | grep -qi "$ENVIRONMENT"; then
  terraform workspace new "$ENVIRONMENT"
fi
terraform workspace select "$ENVIRONMENT"
terraform get
#export TF_BACKEND_S3_BUCKET="my-bucket" # workaround for multi account s3 backend since variable interpolation is not supported directly(as of tf 0.12).
terraform apply \
  -var "region=$REGION" \
  -var "Application=$APPLICATION_TAG" \
  -var "Name=$NAME_TAG" \
  --auto-approve
