pipeline {
    agent any
        
stages {
        stage('Clone GitHub Repository') {
            steps {
                script {
                    // Define as credenciais SSH para o GitHub
                    def githubCredentials = credentials('7ed72973-12b6-42b4-aea0-cfd9bbd3542d')
                    
                    // Diretório de trabalho para o repositório do GitHub
                    def githubRepoDir = "${WORKSPACE}/github-repo"
                    
                    // Limpa o diretório de trabalho anterior, se necessário
                    sh "rm -rf ${githubRepoDir}"
                    
                    // Clone o repositório do GitHub via SSH
                    sh "git clone git@github.com:doug260188/Mulherpmc.git ${githubRepoDir}"
                }
            }
        }
    }
}
