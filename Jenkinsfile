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
    

        stage('BUILD') {
            steps {
                //sh ''
                sh 'docker build -t ${JOB_NAME}:latest -f Dockerfile .'
                //sh ' rm Docke*'

            }
        }
        
        stage('DEPLOY') {
            steps {

                sh '''docker run -itd --restart=always --name ${JOB_NAME} -p909:80 --privileged ${JOB_NAME}:latest'''
                //sh "docker run -itd --restart=always --name ${JOB_NAME} -p9098:8080 --privileged ${JOB_NAME}:latest"

            }
        }
    }
}
