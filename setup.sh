#!/bin/bash
echo "Installer starting..."
echo "Before installing create a blank mysql database called teemops or similar that is accessible from this machine."
#DEFAULTS
ENV_NAME=${1:-dev}
ROOT_DIR=${PWD}
export TEEMOPS_ROOT=$ROOT_DIR
DEFAULT_DB_NAME=teemopsapp-os
DEFAULT_FOLDER=teemops-app
SCHEMA_FOLDER=schema
SCRIPTS_FOLDER=scripts
REPO_THIS=https://github.com/teemops/teemops.git
REPO_API=https://github.com/teemops/core-api.git
REPO_UI=https://github.com/teemops/teemops-ui.git
REPO_BACKEND=https://github.com/teemops/teemops-serverless.git
CFN_ROOT_IAM=https://raw.githubusercontent.com/teemops/teemops/master/cloudformation/iam.ec2.root.role.cfn.yaml

#Check if this is a locally run copy of the script or a Remote run (curl)
if( ! -d "$SCRIPTS_FOLDER" ) ; then
    echo "Pulling down the rest of the repo as well"
    #now pull down all other assets
    git clone $REPO_THIS .
fi

#functions
config_api(){
#Updates database config for API
    cat <<EOF > $ROOT_DIR/temp-api-db.conf.json
{
    "mysql": {
        "host": "$1",
        "db": "$4",
        "user": "$2",
        "pass": "$3",
        "query_timeout": 10000 
    },
    "key2": 500
}
EOF

}

update_db_config_files(){
    cd $ROOT_DIR
    cp -r temp-api-db.conf.json $DEFAULT_FOLDER/core-api/app/config/database.json
    rm -f temp-api-db.conf.json
}

update_api_config_files(){
    echo "Updating API config..."
}

update_ui_config_files(){
    echo "Updating UI config..."
}

install_npm(){
    cd $ROOT_DIR/$DEFAULT_FOLDER/core-api
    npm install
    cd $ROOT_DIR/$DEFAULT_FOLDER/teemops-ui
    npm install
    cd $ROOT_DIR/$DEFAULT_FOLDER/teemops-serverless
    npm install
}

deploy_serverless(){
   cd $ROOT_DIR/$DEFAULT_FOLDER/teemops-serverless
   echo "Deploying serverless"
   serverless deploy --stage $ENV_NAME 
}

install_db(){
    #install_db $mysql_host $mysql_user $mysql_pass $mysql_db
rm -f temp-mysql.cnf
#output config file
cat <<EOF > temp-mysql.cnf
[client]
user=$2
password=$3
EOF

    chmod 0500 temp-mysql.cnf
    
    #check schema dir exists, if not then pull down sql file from github raw
    if [ ! -d "$SCHEMA_FOLDER" ]; then
    cd $ROOT_DIR
    mkdir schema
    curl https://raw.githubusercontent.com/teemops/teemops/master/schema/default.sql --output $SCHEMA_FOLDER/default.sql
    fi

    echo $1 $2 $3 $4
    mysql --defaults-extra-file=temp-mysql.cnf -h $1 $4 < $SCHEMA_FOLDER/default.sql
    rm -f temp-mysql.cnf
    echo 1;
}

prompt_database(){
    echo "MySQL Database install. Please enter MYSQL credentials for setting up schema...\n"
    echo "Host: "
    read mysql_host
    echo "Username:"
    read mysql_user
    stty -echo
    printf "Password: "
    read mysql_pass
    stty echo
    echo "\nDatabase Name:"
    read mysql_db
    echo "Creating database"
    echo $mysql_host $mysql_user $mysql_pass

    db_result=$( install_db $mysql_host $mysql_user $mysql_pass $mysql_db )
    config_api $mysql_host $mysql_user $mysql_pass $mysql_db
    # if db_result=1; then
    #     echo "Database install complete..."
    # else
    #     echo "Database connection or other error"
    # fi

}

download(){
    mkdir $DEFAULT_FOLDER
    cd $DEFAULT_FOLDER
    git clone $REPO_API
    git clone $REPO_UI
    git clone $REPO_BACKEND
}

check_pre(){
    #check pre-requisites
# Check if node is installed otherwise exit
    if which node > /dev/null
    then
        echo "node is installed, skipping..."
    else
        # add deb.nodesource repo commands 
        # install node
        echo "Node and npm needs to be installed first before installing"
        exit
    fi

# Check if mysql is installed otherwise exit
    if which mysql > /dev/null
    then
        echo "mysql is installed, skipping..."
    else
        # add deb.nodesource repo commands 
        # install node
        echo "MySQL needs to be installed first before installing"
        exit
    fi
}

run_aws_install(){
    #installs AWS specific components such as the Ability to STS Assume and launch cloudformation, 
    #serverless components, SQS and Dynamo from the Serverless
    curl $CFN_ROOT_IAM --output cfn.root.iam.cfn.yaml && 
aws cloudformation create-stack --stack-name teemops-root-iam --template-body file://cfn.root.iam.cfn.yaml --capabilities CAPABILITY_NAMED_IAM --region us-west-2

}

install_app (){
    check_pre
    
    prompt_database
    
    download

    update_db_config_files
    
    install_npm

    deploy_serverless

    update_api_config_files

    update_ui_config_files

    echo "Would you like to run the AWS setup or run manually - this requires you to setup an IAM Role, Group and Policies? y/n"
    read aws_yes
    if [ "$aws_yes" = "y" ]; then
        run_aws_install
    else
        echo "AWS Setup skipped run manually, see README for more details."
    fi

    echo "App Installed succesfully"
    list_options
    exit
}

list_options (){
    #Get arguments from user input
    OPTIONS="Install Download CloudFormation Quit"
    select opt in $OPTIONS; do
        if [ "$opt" = "Quit" ]; then
            echo "User quit"
            exit
        elif [ "$opt" = "Install" ]; then
            install_app
        elif [ "$opt" = "Download" ]; then
            download
        elif [ "$opt" = "CloudFormation" ]; then
            run_aws_install
        else
            clear
            echo bad option
        fi
    done
}

list_options
