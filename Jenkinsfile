pipeline {
    agent any
    //agent {label "node0"}

    stages {
        stage('Clonar Repositório') {
            steps {
                // Substitua 'http://git.cuiaba.mt.gov.br/rodrigo.rodrigues/mulher-pmc/-/tree/main/api' pela URL do seu repositório Git
                script {
                    sh 'rm -rf api/'
                    sh 'git@github.com:doug260188/ngink.git'
                    dir('api') {
                        sh 'ls -ltr'
                    }
                }
            }
        }

        stage('BUILD') {
            steps {
                sh 'docker build -t ${JOB_NAME}:latest -f Dockerfile .'
            }
        }
        
        stage('DEPLOY') {
            steps {
                sh 'docker run -itd --restart=always --name ${JOB_NAME} -p9098:8080 --privileged ${JOB_NAME}:latest'
            }
        }
    }
}
