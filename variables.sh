#!/bin/bash

# echo "Choose your service (jss pts ade): "
svc=$1

# echo "Choose your Environment :- (qa prod prf) "
env=$2

# echo "Choose AWS Region :- (use2 usw2) "
region=$3

# Provide Number of replicas 
maxreplicas=$4

ws="${svc}-${env}-${region}"

case $ws in 

"jss-qa-usw2") echo "your env is jss-qa-usw2"

    github_user=MeetSon1
    github_token=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
    github_url=https://$github_user:$github_token@github.com/MeetSon1/argo-task.git
    gbranch=aqa
    argocdurl=20.119.125.44:80
    argocduser=admin
    argocdpassword=Arh0MFRTQ7g71kzy6
    k8snamespace=jss-qa-usw2
    ;;

"jss-prod-usw2") echo "your env is jss-prod-usw2"

    github_user=MeetSon1
    github_token=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
    github_url=https://$github_user:$github_token@github.com/MeetSon1/argo-task.git
    gbranch=aprod
    argocdurl=20.119.125.44:80
    argocduser=admin
    argocdpassword=Arh0MFRTQ7g71kzy
    k8snamespace=jss-prod-usw2
    ;;

*) echo "Invalid value, please enter valid value "
esac

