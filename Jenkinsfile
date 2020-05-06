pipeline {
  agent any

  stages {
    stage('JIRA - Add comment') {
      script {
        def comment = [ body: 'test comment' ]
        jiraAddComment site: 'JIRA-apigate', idOrKey: sh 'git log --format=format:%s -1', input: comment
      }
      echo 'Comment has been added.'
    }
  }
}
