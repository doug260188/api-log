pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                script {
                    // Limpe o diretório de trabalho anterior, se necessário
                    sh 'rm -rf api/'
                    
                  
                    // Clone o repositório Azure DevOps via SSH
                    sh 'git clone git@github.com:doug260188/Mulherpmc.git'
                }
            }
        }
    }
}
