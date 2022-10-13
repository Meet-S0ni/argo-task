#!/bin/bash

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

# Replicas 
replicas=$maxreplicas

# namespace
app=$k8snamespace

    # removing old directory
    rm -rf argo-task

    # cloning repo with branch 
    git clone -b $branch --single-branch $gurl argo-task && cd argo-task
    
    # variables for replicas
    oreplicas="replicas: $(cat deployment.yaml | grep replicas | awk '{print $2}')"
    newreplicas="replicas: $replicas"
    # changing replicas
    sed -i "s/$oreplicas/$newreplicas/g" deployment.yaml

    # commiting changes to repository 
    git add .
    git commit -m "Update deployment.yaml"

    # pushing changes to public repository 
    git push origin $branch

    # argocd login 
    argocd login $argourl --username $auser --password $apassword --insecure

    # performing argocd sync 
    argocd app sync $app
