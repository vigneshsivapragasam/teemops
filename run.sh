#!/bin/bash
echo "running teemops"
echo "API starting..."

ROOT_DIR=${PWD}

cd teemops-app/core-api
npm start
echo "API Started"
