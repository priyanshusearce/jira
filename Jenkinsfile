node {
  stage('Stage-1'){
    echo 'Pipeline has been triggered successfully'
  }
  
  // stage('JIRA - Get Transitions Issue'){
  //   withEnv(['JIRA_SITE=JIRA-apigate']) {
  //       def transitions = jiraGetIssueTransitions idOrKey: 'DEM-1'
  //       echo transitions.data.toString()
  //   }
  // }

  
  stage('Checkout') {

        checkout scm
        
    }
  
  
  stage('Task Stage'){
      echo 'Task has been started successfully.'
  }

  stage('JIRA - Change the Status') {
    withEnv(['JIRA_SITE=JIRA-apigate']) {
      echo 'Task has been started'
      
      def transitionInput = [transition: [id: 31]]
      jiraTransitionIssue idOrKey: 'DEM-1', input: transitionInput

    }

    echo 'Task Status has been changed'
  }

  stage('JIRA - Add comment') {
    withEnv(['JIRA_SITE=JIRA-apigate']) {
      def comment = [ 
        body: 'This is a temporary comment.' 
      ]
      jiraAddComment idOrKey: 'DEM-1', input: comment
    }

    echo 'Comment has been added.'
  }

  stage('Finish Stage'){
    echo 'Pipeline terminated successfully'
  }
}
