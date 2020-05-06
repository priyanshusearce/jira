pipeline {
  agent any

  stages {
    stage('Checking code'){
      steps{
        script{
          sh 'git log --format=format:%s -1'
        }
      }
    }
  }
}
