pipeline {
    agent any

    stages {
        stage('Clonar Repositório') {
            steps {
                script {
                    // Substitua 'http://git.cuiaba.mt.gov.br/rodrigo.rodrigues/mulher-pmc/-/tree/main/api' pela URL do seu repositório Git
                    sh 'rm -rf api/'
                    sh 'git clone git@ssh.dev.azure.com:v3/Loglab/SMGE-MULHER/api api'
                }
            }
        }

    
        stage('BUILD') {
            steps {
                //sh ''
                sh '''docker build -t ${JOB_NAME}:latest -f /opt/jenkins-dados/workspace/test1/app/Dockerfile .'''
                //sh ' rm Docke*'

            }
        }
        
        stage('DEPLOY') {
            steps {

                //sh '''docker run -itd --restart=always --name ${JOB_NAME} -p9099:80 --privileged ${JOB_NAME}:latest'''
                //sh '''docker run -itd --restart=always --name ${JOB_NAME} -p909:80 --privileged ${JOB_NAME}:latest'''
                sh ''docker run -itd --restart=always --name ${JOB_NAME} -p9098:8080 --privileged ${JOB_NAME}:latest'''

            }
        }
    }
}
