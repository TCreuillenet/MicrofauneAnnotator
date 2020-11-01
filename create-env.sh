#!/bin/bash

APPLICATION_NAME="microfaune"

if [ -z "${1}" ]; then
    echo "\$1: <env> is mandatory"
    exit 0
else
    ENVIRONMENT=$1
    echo "====== Will create environment : $ENVIRONMENT"
fi

if [ "${DEPLOY_RDS}" == "true" ]; then
    echo "====== Will create RDS database"
fi

# create application if not created yet
eb init $APPLICATION_NAME -p python-3.7

INSTANCE_OPTIONS="--region eu-west-3 --single -i t2.micro"
DB_OPTIONS="-db.engine postgres -db.i db.t2.micro -db.user ebroot -db.pass microfaune -db.size 5"

if [ "${DEPLOY_RDS}" == "true" ]; then
    eb create $ENVIRONMENT $INSTANCE_OPTIONS $DB_OPTIONS
else
    eb create $ENVIRONMENT $INSTANCE_OPTIONS
fi

echo "====== DONE"
