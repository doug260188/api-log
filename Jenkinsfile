pipeline {
    agent { label 'node1' }

    stages {
        stage('Clonar Repositório') {
            steps {
                script {
                    // Substitua 'http://git.cuiaba.mt.gov.br/rodrigo.rodrigues/mulher-pmc/-/tree/main/api' pela URL do seu repositório Git
                    sh 'rm -rf app/'
                    sh 'git clone https://Loglab@dev.azure.com/Loglab/SMGE-MULHER/_git/quasar app'
                }
            }
        }

    
        stage('BUILD') {
            steps {
                //sh ''
                sh 'cd app/'
                sh "docker build -t ${JOB_NAME}:latest ."
                sh ' rm Docke*'

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
