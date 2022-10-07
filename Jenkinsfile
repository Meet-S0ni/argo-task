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
    
    // This stage is for ssh into k8s cluster   
    stage("SSH Into k8s Server") {

        sh 'echo "connecting via ssh to master node"'
        def remote = [:]
        remote.name = 'k8smaster'
        remote.host = '13.233.54.174'
        remote.user = 'azureuser'
        remote.password = 'Password@123'
        remote.allowAnyHosts = true

        stage('Put deployment.yaml into k8smaster') {
            sshPut remote: remote, from: 'deployment.yaml', into: '.'
        } 

        // stage('Put deployment.yaml into k8smaster') {
        //     sshPut remote: remote, from: 'deployment.yaml', into: '.'
        // } 

        stage('Deploy simple web') {
            sshCommand remote: remote, command: "kubectl apply -f deployment.yaml"
        }
    } 
