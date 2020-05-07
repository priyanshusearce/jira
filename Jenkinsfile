node {
  stage('checkout'){
    checkout scm
  }
  def issueKey
  def jiraSite = 'JIRA-apigate'

  stage('Checking Code'){
    issueKey = sh (
      script: 'git log --format=format:%s -1',
      returnStdout: true,
    ).trim() 
  }

  stage('Getting Values'){
    echo "${issueKey}"
    echo jiraSite
  }
}
