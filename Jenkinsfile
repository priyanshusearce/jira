pipeline {
  agent any

  stages {
    stage('Checking code'){
      steps{
        script{
          echo "1"
          sh 'git log --format=format:%s -1'
          
          echo "2"
          sh 'git log --format=format:%s -1 ${GIT_COMMIT}'
          
          echo "3"
          sh 'git --no-pager show -s --format='%s' ${GIT_COMMIT}'
        }
      }
    }
  }
}
