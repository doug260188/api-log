pipeline {
    agent any
        
stages {
        stage('Clone Azure DevOps Repository') {
            steps {
                script {
                    // Define as credenciais do Azure DevOps
                    def azureDevOpsCredentials = credentials('cc74f3ad-077e-453a-b432-3aeb57706ead')
                    
                    // Diretório de trabalho para o repositório do Azure DevOps
                    def azureDevOpsRepoDir = "${WORKSPACE}/azure-devops-repo"
                    
                    // Limpa o diretório de trabalho anterior, se necessário
                    sh "rm -rf ${azureDevOpsRepoDir}"
                    
                    // Clone o repositório do Azure DevOps
                    sh "git clone git@ssh.dev.azure.com:v3/Loglab/SMGE-MULHER/api ${azureDevOpsRepoDir}"
                }
            }
        }
    }
}
