    stage("Cloning Repository") {
        git branch: 'script', credentialsId: 'github', url: 'https://github.com/MeetSon1/argo-task.git'
    }

    stage('Test auto change directory'){
        sh 'echo "$PWD"'
        sh 'ls'
    }

    stage("SSH into argoserver") {
            echo 'Testing the application...'
    }

    stage("Deploy") {
            echo 'Deploying the application...'
    }


