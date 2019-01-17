# Teemops

Teemops is simplified AWS (Amazon Web Services) management.

It consists of a UI, API and back end processing services.

# Components
Teemops has a number of separate repositories that make up the entire application.
API: https://github.com/teemops/core-api
UI: https://github.com/teemops/teemops-ui
Back End: https://github.com/teemops/teemops-serverless
Services: Not released yet - manages updating of latest AMIs for EC2 actions.
Database schema: located in this repo under schema/

# AWS Setup Explanation
Teemops works using Cross Account IAM Role access which allows it to manage multiple resources in an unlimited number of AWS Accounts.

In essence Teemops needs to be installed on any AWS account that can Cross account to any AWS account.

A typical structure is:
-root Teemops AWS Account
    - AWS Account #1
    - AWS Account #2...
    ....
    - AWS Account #n

Teemops requires the ability to do the following in your root AWS account:
Create SQS Queues
Create S3 Buckets
CloudFormation
Lambda
DynamoDB 

The following section outines the Cloudformation template required and installation scripts for the entire application.

# BEFORE Setup
Run this CloudFormation which will create the following resources in either a dev or prod ROOT Teemops AWS account:
IAM Policy for local dev or production EC2 instance
IAM Role and Instance Profile that can be attached to EC2 instance
IAM Group that dev users can be added to.

Step 1: Run CloudFormation https://github.com/teemops/teemops/cloudformation/iam.ec2.root.role.cfn.yaml
```
aws cloudformation create-stack --stack-name teemops-root-iam --template-url https://github.com/teemops/teemops/cloudformation/iam.ec2.root.role.cfn.yaml
```

If you are runnning on a dev machine locally you will need to ensure your AWS IAM user is attached 

If you are running on an EC2 Instance you will need to use Instance Profile created in the above CloudFormation template.

# Setup
Setup is pretty simple. Just download and run this repo's setup.sh script or run the following command on a linux or MAC OSX

```
bash <(curl -s https://github.com/teemops/teemops/setup.sh)
```
If on a MAC you may need to use sudo

```
sudo bash <(curl -s https://github.com/teemops/teemops/setup.sh)
```

# Pre-requisites
To run the above needs to be done on a MAC OSX or Ubuntu machine with the following installed:
Node
NPM
MYSQL
Serverless (Will attempt to install if it is not installed)
If these aren't installed the installation will notify when the script runs.



