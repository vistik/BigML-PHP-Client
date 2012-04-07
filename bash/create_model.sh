#!/bin/bash

BIGML_URL=$1
BIGML_USERNAME=$2
BIGML_API_KEY=$3
BIGML_AUTH="username=$BIGML_USERNAME;api_key=$BIGML_API_KEY;"
DATASET=${4}
RESOURCE="model"

if [ -z $DATASET ]; then
    echo "Usage: ./create_model.sh dataset/id"
    exit 1
fi


curl "$BIGML_URL$RESOURCE?$BIGML_AUTH" \
     -X POST \
     -H "content-type: application/json" \
     -d "{\"dataset\": \"$DATASET\"}" \
     | python -m json.tool
