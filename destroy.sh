#!/usr/bin/env bash

ENVIRONMENT=$1
REGION=$2
APPLICATION_TAG=$3
NAME_TAG=$4


terraform init
if ! terraform workspace list 2>&1 | grep -qi "$ENVIRONMENT"; then
  terraform workspace new "$ENVIRONMENT"
fi
terraform workspace select "$ENVIRONMENT"
terraform get
terraform destroy \
  -var "region=$REGION" \
  -var "Application=$APPLICATION_TAG" \
  -var "Name=$NAME_TAG" \
  --auto-approve