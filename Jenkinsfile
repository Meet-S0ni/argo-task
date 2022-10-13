node {

    // this stage is for cloning scripts and credentials in jenkins server  
    stage('clone repository'){
    sh 'echo "Cloning the repository"'
    checkout scm
    }

    stage("SSH Into k8s Server") {

        sh 'echo "connecting via ssh to master node"'
        def remote = [:]
        remote.name = 'meetvm2'
        remote.host = '4.240.61.198'
        remote.user = 'meet'
        remote.password = 'meet'
        remote.allowAnyHosts = true

        // stage('Put deployment.yaml into k8smaster') {
        //     sshPut remote: remote, from: 'deployment.yaml', into: '.'
        // } 

        stage('Deploy simple web') {
            sshCommand remote: remote, command: "pwd"
            sshCommand remote: remote, command: "mkdir ./meet"
        }
    } 
}
