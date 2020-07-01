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
          sh 'terraform init -reconfigure'
        }  
      }
    }
    stage('plan') {
      steps {
        ansiColor('xterm'){
          sh 'terraform plan -out myplan'  
        }
      }
    }
    stage('TF Apply') {
      steps {
        ansiColor('xterm'){
          sh 'terraform apply -input=false myplan'
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