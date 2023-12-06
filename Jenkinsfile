pipeline {
    agent {
        label 'homo'
    }

    stages {
        stage('Clonar Repositório') {
            steps {
                script {
                    // Remover o diretório se ele já existir
                    sh 'rm -rf api'

                    // Clonar o repositório
                    sh 'git clone git@gitlab.com:rodrigo.srodrigues/mulherpmc.git api'
                }
            }
        }

        stage('BUILD') {
            steps {
                dir('api') {
                    sh 'docker build -t ${JOB_NAME}:latest -f /opt/jenkins-dados/workspace/portal-pmc-holog/Dockerfile .'
                }
            }
        }
        
        stage('DEPLOY') {
            steps {
                dir('api') {
                    sh 'docker run -itd --restart=always --name ${JOB_NAME} -p2003:80 --privileged portal-pmc-holog:latest'
                }
            }
        }
    }
}
