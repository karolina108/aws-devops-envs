#! /bin/bash

if [ -z "${1}" ]
then
    REGION=$AWS_DEFAULT_REGION
else
    REGION=${1}
fi

TEMPLATE_DIR="templates"

# for TEMPLATE in templates/*.yaml; do
#     aws cloudformation validate-template \
#         --template-body "file://$TEMPLATE" \
#         --region $REGION
# done;

for TEMPLATE in templates/*/*.yaml; do
    aws cloudformation validate-template \
        --template-body "file://$TEMPLATE" \
        --region $REGION
done;