pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    // Define as credenciais SSH
                    def gitCredentials = credentials('7ed72973-12b6-42b4-aea0-cfd9bbd3542d')

                    // Diretório de trabalho
                    def workspace = pwd()

                    // Caminho para o diretório do repositório clonado
                    def repoDir = "${workspace}/Mulherpmc"

                    // Limpa o diretório de trabalho anterior, se necessário
                    sh "rm -rf ${repoDir}"

                    // Clone o repositório do GitHub via SSH
                    sh "git clone git@github.com:doug260188/Mulherpmc.git ${repoDir}"
                }
            }
        }
    }
}
