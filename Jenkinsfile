pipeline {
  agent {
      label 'terraform-slave'
  }
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('init') {
      steps {
        ansiColor('xterm') {
          sh 'terraform init'
        }  
      }
    }
    stage('plan') {
      steps {
        ansiColor('xterm'){
          sh 'terraform plan -out tfplan'  
        }
      }
    }
    stage('TF Apply') {
      steps {
        ansiColor('xterm'){
          sh 'terraform apply -input=false tfplan'
        }
      }
    }
  }
}