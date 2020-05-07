node {
  stage('checkout'){
    checkout scm
  }
  def issueKey

  stage('Testing Code'){
    issueKey = sh (
      script: 'git log --format=format:%s -1',
      returnStdout: true,
    ).trim()
    echo "${issueKey}" 
  }
}
