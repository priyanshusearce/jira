pipeline {
  agent {
      label 'terraform-slave'
  }
  stages {
    stage('Checkout') {
      steps {
        checkout scm

        // withCredentials([string(credentialsId: 'terraform-auth', variable: 'SVC_ACCOUNT_KEY')]){
        //   sh 'mkdir -p creds' 
        //   sh 'echo $SVC_ACCOUNT_KEY | base64 -d > ./creds/credentials.json'
        // }
      }
    }
    stage('init') {
      steps {
        ansiColor('xterm') {
          sh 'terraform init -reconfigure'
        }  
      }
    }
    stage('plan') {
      steps {
        ansiColor('xterm'){
          sh 'terraform plan'  
        }
      }
    }
    stage('TF Apply') {
      steps {
        ansiColor('xterm'){
          sh 'terraform apply -auto-approve'
        }
      }
    }
    stage('TF Destroy') {
      steps {
        ansiColor('xterm'){
          sh 'terraform destroy -auto-approve'
        }
      }
    }
  }
}