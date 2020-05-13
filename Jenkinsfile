node('jenkins-slave') {

  def issueKey
  def jiraSite = 'JIRA-apigate'
  
  stage('Checkout SCM') {
    checkout scm
    
    def SVC_ACCOUNT_KEY = credentials('terraform-auth')
    sh 'mkdir -p creds' 
    sh 'echo $SVC_ACCOUNT_KEY | base64 -d > ./creds/credentials.json'
  }
  
  stage('Checking Code'){
    issueKey = sh (
      script: 'git log --format=format:%s -1',
      returnStdout: true,
    ).trim()

    echo "${issueKey}" 
  }

  stage('Stage 1: Init'){
    sh 'terraform init'
  }
  
  stage('Stage 2: Plan'){
    sh 'terraform plan -out myplan'
  }

  stage('Stage 3: Apply'){
    sh 'terraform apply -input=false myplan'
  }

  stage('Stage 4: Destroy'){
    sh 'terraform destroy'
  }

  stage('JIRA - Change the Status') {
    def transitionInput = [transition: [id: 31]]
    jiraTransitionIssue site: jiraSite, idOrKey: "${issueKey}", input: transitionInput

    echo 'Task Status has been changed'
  }

  stage('Add comment to the JIRA issue'){
    def comment = [ body: 'Dynamically added the issue key.' ]
    jiraAddComment site: jiraSite, idOrKey: "${issueKey}", input: comment
  }

  stage('Finish Stage'){
    echo 'Pipeline terminated successfully'
  }
}

// def comment

// pipeline{
//   agent{
//     label 'jenkins-slave'
//   }

//   stages{
//     stage('Add comment to the JIRA issue'){
//       steps{
//         comment = [ 
//           body: 'Dynamically added the issue key.' 
//         ]
//         jiraAddComment site: 'JIRA-apigate', idOrKey: 'DEM-1', input: comment
//       }
//     }  
//   }
}