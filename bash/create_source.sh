#!/bin/bash

BIGML_URL=$1
BIGML_USERNAME=$2
BIGML_API_KEY=$3
BIGML_AUTH="username=$BIGML_USERNAME;api_key=$BIGML_API_KEY;"
FILE=${4}
RESOURCE="source"

if [ ! -f $FILE ]; then
    echo "Source file '$FILE' not readable"
    exit 1
fi

curl "$BIGML_URL$RESOURCE?$BIGML_AUTH" \
     -F file=@$FILE \
     | python -m json.tool
