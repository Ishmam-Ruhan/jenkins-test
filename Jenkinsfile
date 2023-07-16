def discordWebhookUrl = 'https://discordapp.com/api/webhooks/1110871631649308732/c22PrimIGPeiCKdJYtg06hXdbaIazu3IOdoJykK17Pj9vuWEJOA8Gvluo0PO3bubXMFc'

def ubuntuUser = 'sudo -u ashiq '

pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build & Deploy') {
      steps {
        script {
          try{
                //Main Command
                sh ubuntuUser+'/home/ashiq/jenkins-test/run.sh'

                 discordSend description: "Build & Deployment Success. Please wait a while to get system fully restarted.",
                   footer: "Commit: ${env.GIT_COMMIT}",
                   link: "${env.GIT_URL}/commit/${env.GIT_COMMIT}",
                   result: currentBuild.currentResult,
                   title: JOB_NAME,
                   webhookURL: discordWebhookUrl
          }catch(e){
               def buildLogUrl = "${env.BUILD_URL}consoleText"
               discordSend description: "Build Failed. Full pipeline log:\n${buildLogUrl}",
                   unstable: true,
                   footer: "Commit: ${env.GIT_COMMIT}",
                   link: "${env.GIT_URL}/commit/${env.GIT_COMMIT}",
                   result: currentBuild.currentResult,
                   title: JOB_NAME,
                   webhookURL: discordWebhookUrl
          }
        }
      }
    }
  }
}