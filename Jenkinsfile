node {
    def registryProjet = 'registry.gitlab.com/punchco1/jenkins'
    def IMAGE = "${registryProjet}:version-${env.BUILD_ID}"
    
    stage('Clone'){
        git 'https://github.com/Punchcoco/jen-dock.git'
    }
    
    def img = stage('Build'){
        docker.build("$IMAGE", '.')
    }
    
    stage('Run'){
        img.withRun("--name run-$BUILD_ID -p 80:80") { c ->
            sh 'curl localhost'
        }
        
    }
    
    stage('Push'){
        docker.withRegistry('https://registry.gitlab.com', '57067624-3ed3-45db-85bd-044c36d15cc0'){
            img.push 'latest'
            img.push()
        }
    }
}
