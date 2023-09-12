pipeline {
    
//    agent {label 'node151 || node152 || node153'}
	agent {label 'node1'}

    stages {
            stage('BUILD') {
            steps {
            sh '''docker build -t ${JOB_NAME}:latest -f Dockerfile .'''
//			sh '''docker build -t 10.10.100.150:8083/repository/repositoriologlab/${JOB_NAME}:latest -f Dockerfile .'''
            }
            }         

//            stage('PUSH') {
//            steps {
//            sh '''docker push 10.10.100.150:8083/repository/repositoriologlab/${JOB_NAME}:latest'''
//            }
            }

            stage('DEPLOY') {
                   
            agent {label 'node162'}
            options { skipDefaultCheckout(true) }
         
            steps {
//            sh '''docker rm -f ${JOB_NAME}'''
//            sh '''docker rmi 10.10.100.150:8083/repository/repositoriologlab/${JOB_NAME}:latest'''
            sh '''docker run -itd --restart=always --name ${JOB_NAME} -p9098:8080 --privileged ${JOB_NAME}:latest'''
//			sh '''docker run -itd --restart=always --name ${JOB_NAME} -p9098:8080 --privileged 10.10.100.150:8083/repository/repositoriologlab/${JOB_NAME}:latest'''
            }
        }
    }
//    post {
//        always {
//        script {
//        mail(body: "O job ${env.JOB_NAME} foi executado com ${currentBuild.result}.\n\n JOB Url - ${env.BUILD_URL}\n\n API Url - ${env.IGEPREV_ESG_APP_v2}\n\n LOG Url - ${env.BUILD_URL}/consoleText\n\n",
//        from: 'noreply@loglabdigital.com.br', subject: "${currentBuild.result}", to: 'infraestrutura@loglabdigital.com.br', cc: '')
//        }
//        }
//        
//        success {
//        script {
//        mail(body: "O job ${env.JOB_NAME} foi executado com ${currentBuild.result}.\n\n JOB Url - ${env.BUILD_URL}\n\n API Url - ${env.IGEPREV_ESG_APP_v2}\n\n LOG Url - ${env.BUILD_URL}/consoleText\n\n",
//        from: 'noreply@loglabdigital.com.br', subject: "${currentBuild.result}", to: "altieri@loglabdigital.com.br", cc: '')
//        }
//        }
//
//        failure {
//        script {
//        mail(body: "O job ${env.JOB_NAME} foi executado com ${currentBuild.result}.\n\n JOB Url - ${env.BUILD_URL}\n\n API Url - ${env.IGEPREV_ESG_APP_v2}\n\n LOG Url - ${env.BUILD_URL}/consoleText\n\n",
//        from: 'noreply@loglabdigital.com.br', subject: "${currentBuild.result}", to: "altieri@loglabdigital.com.br", cc: '')
//        }
//        }
//    }
}