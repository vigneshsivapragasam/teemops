#!/bin/bash
echo "running teemops"
echo "API starting..."

ROOT_DIR=${PWD}

#start api
cd $ROOT_DIR/teemops-app/core-api
npm start
echo "API Started"

#start UI
cd $ROOT_DIR/teemops-app/teemops-ui
grunt serve
echo "API Started"

#serverless parts should already happen automatically