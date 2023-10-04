pipeline {
    agent any

    stages {
        stage('Clonar Repositório') {
            steps {
               
                // Substitua 'http://git.cuiaba.mt.gov.br/rodrigo.rodrigues/mulher-pmc/-/tree/main/api' pela URL do seu repositório Git
                sh 'rm -rf api/'
                sh 'git clone git@ssh.dev.azure.com:v3/Loglab/SMGE-MULHER/api'
            } 
        }

    
        stage('BUILD') {
            steps {
                //sh ''
                sh ''' cd /opt/jenkins-dados/workspace/SMGE-MULHER-API-HOMOLOGACAO/api'''
                sh '''docker build .'''
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
