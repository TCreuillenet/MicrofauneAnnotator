#!/bin/bash

INSTANCE_OPTIONS="--single -i t2.micro"
DB_OPTIONS="-db.engine postgres -db.i t2.micro -db.pass microfaune -db.user microfaune -db.version 12 -db.size 5"
VPC_OPTIONS="--vpc.id vpc-0b394b6676b7d50ea --vpc.ec2subnets subnet-0d5d002f6d1fbd06d,subnet-0eb0ad70069b6d265 --vpc.dbsubnets subnet-068b7ee5c1d254e3b,subnet-0862c6bea72c893be"
eb create --region eu-west-3 $INSTANCE_OPTIONS $VPC_OPTIONS $DB_OPTIONS
