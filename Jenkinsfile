pipeline {
    agent { label 'node1' }

    stages {
        stage('Clonar Repositório') {
            steps {
                script {
                    // Substitua pela URL do seu repositório Git
                    sh 'rm -rf quasar/'
                    sh 'git clone git@ssh.dev.azure.com:v3/Loglab/SMGE-MULHER/quasar'
                }
            }
        }

        stage('BUILD') {
            steps {
                script {
                    // Altere para o diretório clonado
                    dir('quasar') {
                        // Verifique se o arquivo package.json está presente
                        sh 'ls -ltr' // Isso exibirá o conteúdo do diretório para verificar a presença do arquivo package.json
                        sh 'npm install' // Execute o npm install no diretório correto
                    }

                    // Continue com os outros comandos
                    sh "docker build -t ${JOB_NAME}:latest -f Dockerfile ."
                    sh 'rm Docke*'
                }
            }
        }

        stage('DEPLOY') {
            steps {
                script {
                    // Execute o contêiner Docker
                    sh "docker run -itd --restart=always --name ${JOB_NAME} -p 909:80 --privileged ${JOB_NAME}:latest"
                }
            }
        }
    }
}
