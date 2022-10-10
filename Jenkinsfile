node {

    // this stage is for cloning scripts and credentials in jenkins server  
    stage('clone repository'){
    sh 'echo "Cloning the repository"'
    checkout scm
    }

    stage("SSH Into argocd Server") {

        sh 'echo "connecting via ssh to master node"'
        def remote = [:]
        remote.name = 'argoserver'
        remote.host = '13.233.54.174'
        remote.user = 'azureuser'
        remote.password = 'Password@123'
        remote.allowAnyHosts = true

        // stage('Put deployment.yaml into k8smaster') {
        //     sshPut remote: remote, from: 'main.sh', into: '.'
        // } 

        // stage('Put deployment.yaml into k8smaster') {
        //     sshPut remote: remote, from: 'variables.sh', into: '.'
        // } 

        stage('Testing command works or not') {
            sshCommand remote: remote, command: "sudo pwd"
            sshCommand remote: remote, command: "sudo mkdir ~/meet"
            sshCommand remote: remote, command: "sudo ls"
        }
    } 
}
