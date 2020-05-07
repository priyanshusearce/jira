node {
  stage('checkout'){
    checkout scm
  }
  
  stage('Testing Code'){
    sh 'git log --format=format:%s -1'
  }
}
