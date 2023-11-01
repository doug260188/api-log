pipeline {
    agent any
        
    stages {
        stage('Clone GitHub Repository') {
            steps {
                script {
                    // Define as credenciais SSH para o GitHub
                    def githubCredentials = credentials('cc74f3ad-077e-453a-b432-3aeb57706ead')
                    
                    // Diretório de trabalho para o repositório do GitHub
                    def githubRepoDir = "${WORKSPACE}/github-repo"
                    
                    // Limpa o diretório de trabalho anterior, se necessário
                    sh "rm -rf ${githubRepoDir}"
                    
                    // Clone o repositório do GitHub via SSH
                    sh "git clone git@github.com:doug260188/Mulherpmc.git ${githubRepoDir}"
                }
            }
        }
    

        stage('Clone Azure DevOps Repository') {
            steps {
                script {
                    // Define as credenciais do Azure DevOps
                    def azureDevOpsCredentials = credentials('azuredevops')
                    
                    // Diretório de trabalho para o repositório do Azure DevOps
                    def azureDevOpsRepoDir = "${WORKSPACE}/azure-devops-repo"
                    
                    // Limpa o diretório de trabalho anterior, se necessário
                    sh "rm -rf ${azureDevOpsRepoDir}"
                    
                    // Clone o repositório do Azure DevOps
                    sh "git clone https://Loglab@dev.azure.com/Loglab/SMGE-MULHER/_git/api ${azureDevOpsRepoDir}"
                }
            }
        }     
    }
}
