pipeline {
  agent any

  stages {
    stage('JIRA - Add comment') {
      withEnv(['JIRA_SITE=JIRA-apigate']) {
        def comment = [ 
          body: 'This is a temporary comment.' 
        ]
        jiraAddComment idOrKey: 'DEM-1', input: comment
      }

      echo 'Comment has been added.'
    }
  }
}
