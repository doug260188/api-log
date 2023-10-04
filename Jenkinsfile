pipeline {
    agent any

    stages {
        stage('Clonar Repositório') {
            steps {
               
                // Substitua 'http://git.cuiaba.mt.gov.br/rodrigo.rodrigues/mulher-pmc/-/tree/main/api' pela URL do seu repositório Git
                //sh 'rm -rf api/'
                //sh 'git clone git@ssh.dev.azure.com:v3/Loglab/SMGE-MULHER/api'
                //sh ' cd /api'
                //sh 'ls -ltr'
                sh 'rm -rf api/'
                sh 'git clone git@ssh.dev.azure.com:v3/Loglab/SMGE-MULHER/api'
                dir('api') {
                sh 'ls -ltr'
            } 
        }

    }
        stage('BUILD') {
            steps {
                sh '''docker build -t bitnami/laravel -f Dockerfile /opt/jenkins-dados/workspace/SMGE-MULHER-API-HOMOLOGACAO/api .'''
                //sh '''docker build -t ${JOB_NAME}:latest -f /opt/jenkins-dados/workspace/SMGE-MULHER-API-HOMOLOGACAO/api/Dockerfile .'''
                //sh ' rm Docke*'

            }
        }
        
        stage('DEPLOY') {
            steps {

                sh '''docker run -itd --restart=always --name ${JOB_NAME} -p9098:8080 --privileged ${JOB_NAME}:latest'''
            }
    
        }
    
    }

}
CMD ["catalina.sh", "run"]
