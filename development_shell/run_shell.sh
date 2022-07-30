#!/bin/bash

if [ -z "$1" ]
then
  echo "you must provide VERSION variable"
  exit 1
fi

docker run -it --rm --name pigeonapi-db-infra-container \
    --volume ~/SourceCode/asTech_Projs/api-db-infrastructure/infrastructure/terraform:/terraform \
    mattman70/tf1-2-1-ansible-shell:$1