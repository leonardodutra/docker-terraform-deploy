#!/bin/bash
aws configure set aws_access_key_id $aws_access_key_id
aws configure set aws_secret_access_key $aws_secret_access_key

terraform init
terraform plan
terraform apply -auto-approve