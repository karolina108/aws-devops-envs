#! /bin/bash
PROJECT="devops-toolbox"
COMPONENT="envs"
LAYER="shared"
STAGE="dev"

REGION="us-east-1"
TEMPLATE="templates/shared-resources.yaml"

deploy="aws cloudformation deploy \
    --stack-name ${PROJECT}-${COMPONENT}-${LAYER}-${STAGE}-resources \
    --template-file ${TEMPLATE} \
    --parameter-overrides Project=${PROJECT} \
        Stage=${STAGE} \
        Component=${COMPONENT} \
        Layer=${LAYER} \
    --no-fail-on-empty-changeset \
    --region ${REGION} \
    --tags Project=${PROJECT} Stage=${STAGE} Component=${COMPONENT}"

$deploy