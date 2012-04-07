#!/bin/bash

BIGML_URL=$1
BIGML_USERNAME=$2
BIGML_API_KEY=$3
BIGML_AUTH="username=$BIGML_USERNAME;api_key=$BIGML_API_KEY;"
SOURCE=${4}
RESOURCE="dataset"

if [ -z $SOURCE ]; then
    echo "Usage: ./create_dataset.sh source/id"
    exit 1
fi


curl "$BIGML_URL$RESOURCE?$BIGML_AUTH" \
     -X POST \
     -H "content-type: application/json" \
     -d "{\"source\": \"$SOURCE\"}" \
     | python -m json.tool
