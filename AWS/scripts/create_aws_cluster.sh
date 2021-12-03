#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

 gcloud container aws clusters create $1 \
  --location=$2 \
  --aws-region=$3 \
  --cluster-version=$4 \
  --config-encryption-kms-key-arn=$5 \
  --database-encryption-kms-key-arn=$5 \
  --iam-instance-profile=$6 \
  --pod-address-cidr-blocks="10.2.0.0/16" \
  --role-arn=$7 \
  --service-address-cidr-blocks="10.1.0.0/16" \
  --subnet-ids=${8} \
  --vpc-id=${9} \
  --tags="Name=${1}-cp" \
  --fleet-project=${10}