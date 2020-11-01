#!/bin/bash

if [ -z "${1}" ]; then
    echo "\$1: <env> is mandatory"
    exit 0
else
    ENVIRONMENT=$1
    echo "Will create environment : $ENVIRONMENT"
fi

INSTANCE_OPTIONS="--region eu-west-3 --single -i t2.micro"
DB_OPTIONS="-db.engine postgres -db.i db.t2.micro -db.user ebroot -db.pass microfaune -db.size 5"
eb create $ENVIRONMENT $INSTANCE_OPTIONS $DB_OPTIONS
