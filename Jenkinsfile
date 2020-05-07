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

  stage('Add comment to the JIRA issue'){
    def comment = [ body: 'Dynamically added the issue key.' ]
    jiraAddComment site: jiraSite, idOrKey: "${issueKey}", input: comment
  }
}
