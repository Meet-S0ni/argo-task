node {
    def app

    // this stage is for cloning scripts and credentials in jenkins server  
    stage('clone repository'){
    sh 'echo "Cloning the repository"'
    checkout scm
    }
    
    // stage('cloning repo'){
    // git branch: 'main', credentialsId: 'github', url: 'https://github.com/MeetSon1/argo-task.git'
    // }
    // both above method works 

    // here we are testing change directory is happaning automatically or not 
    stage('Test auto change directory'){
        sh 'echo "$PWD"'
        sh 'ls'
    }

    // stage('Changing image name in deployment file'){

    stage('Testing script'){

    //     sh 'chmod +x ./script.sh'
    //     sh "sh script.sh"
    // }
            steps {
                script {
                    bash'''#!/bin/bash 
                    source variables.txt
                    nimage=$new_image
                    env=$env
                    echo "$nimage"
                    '''
                }
            }
        }
    // here we are defining variables for replacement command      
        // sh '''source variables.txt
        // nimage=$new_image
        // ws=$env'''
        // sh 'echo "$env"'
        // sh 'echo "$nimage"'
    // here we are performing replacement in deployment file 
}
