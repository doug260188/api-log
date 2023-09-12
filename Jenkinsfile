pipeline {
    agent { label 'node0' }
        
    stages {
        stage('BUILD') {
            steps {
                sh 'wget https://github.com/doug260188/api-log/blob/main/Dockerfile'
                sh ' pwd'
                sh "docker build -t ${JOB_NAME}:latest -f Dockerfile ."
                sh ' rm Docke*'

            }
        }
        
        stage('DEPLOY') {
            steps {
                               
                sh "docker run -itd --restart=always --name ${JOB_NAME} -p9098:8080 --privileged ${JOB_NAME}:latest"

            }
        }
    }
}