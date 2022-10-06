#!/bin/bash

# getting credentials from credentials.txt file 


source variables.txt

# getting environment

env=$env

# Github Credential 

gurl=$github_url
guser=$github_user
gpassword=$github_token

# Argocd Credentials 

auser=$argocd_user
apassword=$argocd_password

# Latest image from credentials.txt

# oimage=$old_image
nimage=$new_image

# Getting Environment Information from user 

echo "Enter Your Cluster name from 'a b c' : "
read n  

echo "Enter Your environment name from 'dev qa prod' : "
read m 

ws="$env"
# ws="$n$m"

# for i in {1..30}; do if [ $i != 10 ]; then echo "hello $i"; fi; done

# if [[ ("$varword" = $varname1 ) || ("$varword" = $varname2 ) || ("$varword" = $varname3 ) || ("$varword" = $varname4 ) ]]

# if [ $ws == "adev" ]; then
# 	a=0
# elif [ $ws == "aqa" ]; then
# 	a=0
# elif [ $ws == "apro" ]; then
# 	a=0
# elif [ $ws == "bdev" ]; then
# 	a=0
# elif [ $ws == "bqa" ]; then
# 	a=0
# elif [ $ws == "bpro" ]; then
# 	a=0
# elif [ $ws == "cdev" ]; then
# 	a=0
# elif [ $ws == "cqa" ]; then
# 	a=0
# elif [ $ws == "cpro" ]; then
# 	a=0
# else
#     echo "Enter valid value"
#     a=1
# fi

# if [ $a == "0" ]; then
#     echo "your value is valid"

    # removing old directory
    rm -rf argo-task

    # cloning repo with branch 
    git clone -b $ws --single-branch https://$guser:$gpassword@github.com/MeetSon1/argo-task.git && cd argo-task

    # oimage=`cat /root/argo-task/deployment.yaml | grep image | awk '{print $3}'`
    oimage=$(cat deployment.yaml | grep image | awk '{print $3}')
    # oimage=`cat deployment.yaml | grep image | awk '{print $3}'`
    
    # makeing changes in file  
    sed -i 's/'$oimage'/'$nimage'/g' deployment.yaml 

    # commiting changes to repository 
    git add .
    git commit -m "Update deployment.yaml"

    # pushing changes to public repository 
    git push origin $ws

    # argocd login 
    argocd login 20.249.48.28:80 --username $auser --password $apassword --insecure

    # performing argocd sync 
    argocd app sync $ws-app

# else
#     echo "Enter valid eironment value"
# fi



