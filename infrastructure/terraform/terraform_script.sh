#!/bin/bash

if [[ -z "$1" ]] || [[ -z "$2" ]] || [[ -z "$3" ]]
then
  echo "Script requires values for ENV, TF_ACTION and COMMIT"
  exit 1
fi

s3_bucket=api-dbinfra-$1
tfplan_file="tfplan_$1_$3"
echo $tfplan_file

INIT_COMMAND=""
TF_COMMAND=""

INIT_COMMAND=${INIT_COMMAND:="terraform init -backend-config=$1-backend.tfvars"}
echo "Running: $INIT_COMMAND ..."
${INIT_COMMAND}

if [[ $2 = "plan" ]]
then
    TF_COMMAND=${TF_COMMAND:="terraform plan -var-file=$1.tfvars -out=$tfplan_file"}
    echo "Running terraform plan. Out file is $tfplan_file"
    ${TF_COMMAND}
    echo "Copying tfplan_file to S3..."
    aws s3 cp $tfplan_file s3://$s3_bucket/tfplan_files/$tfplan_file
elif [[ $2 = "apply" ]]
then
    echo "Downloading tfplan_file from S3..."
    aws s3 cp s3://$s3_bucket/tfplan_files/$tfplan_file .
    TF_COMMAND=${TF_COMMAND:="terraform apply $tfplan_file"}
    echo "Running terraform apply..."
    ${TF_COMMAND}
else
    echo "No valid TF_ACTION and variable combination provided!"
    exit 1
fi
