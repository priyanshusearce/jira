pipeline {
  agent any

  stages {
    stage('Checking code'){
      steps{
        def issueKey = sh (script: 'git log --format=format:%s -1', returnStdout: true)
        echo  issueKey
      }
    }
  }
}
