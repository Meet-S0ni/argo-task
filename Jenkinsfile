node {
    def app

    // this stage is for cloning scripts and credentials in jenkins server  
    stage('cloning repo'){
    git branch: 'main', credentialsId: 'github', url: 'https://github.com/MeetSon1/argo-task.git'
    }

    // here we are testing change directory is happaning automatically or not 
    stage('Test auto change directory'){
        sh 'echo "$PWD"'
        sh 'ls'
    }

}
