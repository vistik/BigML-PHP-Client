#!/bin/bash

BIGML_URL=$1
BIGML_USERNAME=$2
BIGML_API_KEY=$3
BIGML_AUTH="username=$BIGML_USERNAME;api_key=$BIGML_API_KEY;"
MODEL=${4}
DATA=${5:-"{}"}

RESOURCE="prediction"

if [ -z $MODEL ]; then
    echo "Usage: ./create_prediction.sh model/id [input-data]"
    exit 1
fi

echo "$BIGML_URL$RESOURCE?$BIGML_AUTH" >> text.txt
curl "$BIGML_URL$RESOURCE?$BIGML_AUTH" \
     -X POST \
     -H "content-type: application/json" \
     -d "{\"model\": \"$MODEL\", \"input_data\": $DATA}" \
     -k | python -m json.tool
