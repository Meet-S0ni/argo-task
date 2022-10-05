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

    // here we are testing change directory is happaning automatically or not 
    stage('Test auto change directory'){
        sh 'echo "$PWD"'
        sh 'ls'
    }

}
