node {
  stage('JIRA') {
    withEnv(['JIRA_SITE=JIRA-apigate']) {
      def fields = jiraGetFields idOrKey: 'DEM-1'
      echo fields.data.toString()
    }
  }
}
