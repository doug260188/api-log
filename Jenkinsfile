pipeline {
    agent { label 'node0' }

    stages {
        stage('Clonar Repositório') {
            steps {
                script {
                    // Substitua 'http://git.cuiaba.mt.gov.br/rodrigo.rodrigues/mulher-pmc/-/tree/main/api' pela URL do seu repositório Git
                    sh 'git clone http://git.cuiaba.mt.gov.br/rodrigo.rodrigues/mulher-pmc.git'
                }

    stages {
        stage('BUILD') {
            steps {
                //sh ''
                sh 'wget https://github.com/doug260188/api-log/blob/main/Dockerfile'
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