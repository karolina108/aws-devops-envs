#! /bin/bash
set -e

PROJECT="devops-toolbox"
COMPONENT="envs"
LAYER="network"
STAGE="dev"

REGION="us-east-1"

TEMPLATE="templates/network.yaml"
OUTPUT="build/templates/network-packaged.yaml"
BUCKET=$(aws ssm get-parameter \
    --name /${PROJECT}/${COMPONENT}/shared/${STAGE}/templates-bucket-name \
    --output text \
    --query Parameter.Value \
    --region $REGION)
TOPIC_ARN=/${PROJECT}/${COMPONENT}/shared/${STAGE}/cfn-notifications-topic-arn

package="aws cloudformation package \
    --template-file ${TEMPLATE} \
    --output-template-file ${OUTPUT} \
    --s3-bucket ${BUCKET} \
    --region ${REGION}"

deploy="aws cloudformation deploy \
    --stack-name ${PROJECT}-${COMPONENT}-${LAYER}-${STAGE}-resources \
    --template-file ${OUTPUT} \
    --parameter-overrides Project=${PROJECT} \
        Stage=${STAGE} \
        Component=${COMPONENT} \
        Layer=${LAYER} \
        CfnNotificationTopicArn=${TOPIC_ARN} \
    --no-fail-on-empty-changeset \
    --region ${REGION} \
    --tags Project=${PROJECT} Stage=${STAGE} Component=${COMPONENT}"

$package && $deploy