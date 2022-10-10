#!/bin/bash

# Created by meet soni
# getting environment variables from variables.sh file 
source variables.sh

# Github Credential 
gurl=$github_url
guser=$github_user
gpassword=$github_token
branch=$gbranch

# Argocd Credentials 
argourl=$argocdurl
auser=$argocduser
apassword=$argocdpassword

# image
nimage=$new_image

# namespace
app=$k8snamespace

    # removing old directory
    rm -rf argo-task

    # cloning repo with branch 
    git clone -b $branch --single-branch $gurl argo-task && cd argo-task
    
    oimage=$(cat deployment.yaml | grep image | awk '{print $3}')

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
    argocd app sync $app
