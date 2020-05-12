node {

  def issueKey
  def jiraSite = 'JIRA-apigate'
  
  stage('Checkout SCM') {
    checkout scm
  }
  
  stage('Stage-1'){
    echo 'Pipeline has been triggered successfully'
    sh (
      script: 'terraform init -input=false'
    )
  }
  
  stage('Checking Code'){
    issueKey = sh (
      script: 'git log --format=format:%s -1',
      returnStdout: true,
    ).trim() 
  }

  stage('Task Stage'){
    echo 'Task has been started successfully.'
  }

  // stage('JIRA - Change the Status') {
  //   def transitionInput = [transition: [id: 31]]
  //   jiraTransitionIssue site: jiraSite, idOrKey: "${issueKey}", input: transitionInput

  //   echo 'Task Status has been changed'
  // }

  // stage('Add comment to the JIRA issue'){
  //   def comment = [ body: 'Dynamically added the issue key.' ]
  //   jiraAddComment site: jiraSite, idOrKey: "${issueKey}", input: comment
  // }

  stage('Finish Stage'){
    echo 'Pipeline terminated successfully'
  }
}
