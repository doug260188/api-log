pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                script {
                    // Limpe o diretório de trabalho anterior, se necessário
                    sh 'rm -rf api/'
                    
                    // Adicione a chave SSH do Azure DevOps ao arquivo known_hosts
                    sh 'ssh-keyscan -t rsa ssh.dev.azure.com >> ~/.ssh/known_hosts'
                    
                    // Clone o repositório Azure DevOps via SSH
                    sh 'git clone git@ssh.dev.azure.com:v3/Loglab/SMGE-MULHER/api'
                }
            }
        }
        
        // Outros estágios do seu pipeline podem seguir aqui
    }
    
    post {
        success {
            // Ações a serem executadas em caso de sucesso
        }
        
        failure {
            // Ações a serem executadas em caso de falha
        }
    }
}
