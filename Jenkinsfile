pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                script {
                    // Define as credenciais SSH
                    def gitCredentials = credentials('7ed72973-12b6-42b4-aea0-cfd9bbd3542d')
                    
                    // Limpe o diretório de trabalho anterior, se necessário
                    sh 'rm -rf api/'
                    
                  
                    // Clone o repositório Azure DevOps via SSH
                    sh 'git clone git@github.com:doug260188/Mulherpmc.git'
                }
            }
        }
    }
}
