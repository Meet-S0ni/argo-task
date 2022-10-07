#!/bin/bash

# getting credentials from variables.txt file 
source variables.txt

# Github Credential 
gurl=$github_url
guser=$github_user
gpassword=$github_token

# Argocd Credentials 
argourl=$argocdurl
auser=$argocd_user
apassword=$argocd_password

# Latest image from variables.txt

# oimage=$old_image
nimage=$new_image

# Getting Environment Information from user 
# Getting Environment Information from variables.txt

ws=$env


# # echo "Choose your service (JSS PTS ADE): "
# echo "Choose your service (jss pts ade): "
# read svc

# # echo "Choose your Environment :- (QA PROD PRF) "
# echo "Choose your Environment :- (qa prod prf) "
# read env

# # echo "Choose AWS Region :- (USE2 USW2) "
# echo "Choose AWS Region :- (usw2 use2) "
# read region

echo "#-------------------#"
ws="${svc}-${env}-${region}"
# echo "####################"

# echo "$ws"
# for i in {1..30}; do if [ $i != 10 ]; then echo "hello $i"; fi; done
# if [[ ("$varword" = $varname1 ) || ("$varword" = $varname2 ) || ("$varword" = $varname3 ) || ("$varword" = $varname4 ) ]]
# if [ $ws == "JSS_QA_USW2" ]; then
if [ $ws == "jss-qa-usw2" ]; then
    branch=$branchQa
	a=0
elif [ $ws == "jss_prod_usw2" ]; then
    branch=$branchProd
	a=0
# elif [ $ws == "apro" ]; then
# 	a=0
# elif [ $ws == "bdev" ]; then
# 	a=0
# elif [ $ws == "bqa" ]; then
# 	a=0

else
    echo "Enter valid value"
    a=1
fi

if [ $a == "0" ]; then
    echo "your value is valid"

    # removing old directory
    rm -rf argo-task

    # cloning repo with branch 
    git clone -b $branch --single-branch https://$guser:$gpassword@github.com/MeetSon1/argo-task.git && cd argo-task

    # oimage=`cat /root/argo-task/deployment.yaml | grep image | awk '{print $3}'`
    oimage=$(cat deployment.yaml | grep image | awk '{print $3}')
    # oimage=`cat deployment.yaml | grep image | awk '{print $3}'`
    
    # makeing changes in file  
    sed -i 's/'$oimage'/'$nimage'/g' deployment.yaml 

    # commiting changes to repository 
    git add .
    git commit -m "Update deployment.yaml"

    # pushing changes to public repository 
    git push origin $branch

    # argocd login 
    argocd login $argourl --username $auser --password $apassword --insecure

    # performing argocd sync 
    argocd app sync $ws

else
    echo "Enter valid eironment value"
fi
