node {
    // def app
    
    // this stage is for cloning scripts and credentials in jenkins server  
    stage('clone repository'){
    sh 'echo "Cloning the repository"'
    checkout scm
    }

    // here we are testing change directory is happaning automatically or not 
    stage('Test auto change directory'){
        sh 'echo "$PWD"'
        sh 'ls'
    }
    
    // This stage is for ssh into argocd cluster   
    stage("SSH Into k8s Server") {

        sh 'echo "connecting via ssh to master node"'
        def remote = [:]
        remote.name = 'argoserver'
        remote.host = '20.200.207.213'
        remote.user = 'root'
        remote.password = 'Test@123'
        remote.allowAnyHosts = true

        // stage('Put deployment.yaml into k8smaster') {
        //     sshPut remote: remote, from: 'deployment.yaml', into: '.'
        // } 


        // git branch: 'script', credentialsId: 'github', url: 'https://github.com/MeetSon1/argo-task.git'
        // cloning script repository
        stage('running script') {
            sshCommand remote: remote, command: "git clone -b script --single-branch https://MeetSon1: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@github.com/MeetSon1/argo-task.git && cd argo-task"
            // Testing available files
            sshCommand remote: remote, command: "ls"

        }


        // stage('running script') {
        //     sshCommand remote: remote, command: "chmod +x main.sh"
        //     sshCommand remote: remote, command: "./main.sh"
        // }
    } 
}
