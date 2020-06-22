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
        sh 'terraform init'  
      }
    }
    stage('plan') {
      steps {
        sh 'terraform plan -out myplan'
      }
    }
    stage('TF Apply') {
      steps {
        sh 'terraform apply -input=false myplan'
      }
    }
    stage('TF Destroy') {
      steps {
        sh 'terraform destroy -auto-approve'
      }
    }
  }
}