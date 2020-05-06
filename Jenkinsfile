pipeline {
  agent any

  stages {
    stage('Checking code'){
      steps{
        issueKey = sh (
          script: 'git log --format=format:%s -1', 
          returnStdout: true
        ).trim()
        echo "Commit message : ${issueKey}"
      }
    }
  }
}
