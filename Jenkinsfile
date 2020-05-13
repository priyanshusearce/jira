// node('jenkins-slave') {

//   def issueKey
//   def jiraSite = 'JIRA-apigate'
  
//   stage('Checkout SCM') {
//     checkout scm

//     withCredentials([string(credentialsId: 'terraform-auth', variable: 'SVC_ACCOUNT_KEY')]){
//       sh 'mkdir -p creds' 
//       sh 'echo $SVC_ACCOUNT_KEY | base64 -d > ./creds/credentials.json'
//     }
//   }
  
//   stage('Checking Code'){
//     issueKey = sh (
//       script: 'git log --format=format:%s -1',
//       returnStdout: true,
//     ).trim()

//     echo "${issueKey}" 
//   }

//   stage('Stage 1: Init & Plan'){
//     try{
//       sh 'terraform init'
//       sh 'terraform plan -out myplan'
//     } catch(error) {
//       jiraAddComment idOrKey: "${issueKey}", comment: "${BUILD_URL} ERROR WHILE RELEASING ${error}"
//       currentBuild.result = 'FAILURE'
//     }
    
//   }

//   stage('Stage 2: Apply'){
//     try{
//       sh 'terraform apply -input=false myplan'
//     } catch(error) {
//       jiraAddComment idOrKey: "${issueKey}", comment: "${BUILD_URL} ERROR WHILE RELEASING ${error}"
//       currentBuild.result = 'FAILURE'
//     }
//   }

//   stage('Stage 4: Destroy'){
//     try{
//       sh 'terraform destroy -auto-approve'
//     } catch(error) {
//       jiraAddComment idOrKey: "${issueKey}", comment: "${BUILD_URL} ERROR WHILE RELEASING ${error}"
//       currentBuild.result = 'FAILURE'
//     }
//   }

//   stage('JIRA - Change the Status') {
//     try{
//       def transitionInput = [
//         transition: [
//           id: 31
//         ]
//       ]
//       jiraTransitionIssue site: jiraSite, idOrKey: "${issueKey}", input: transitionInput

//       echo 'Task Status has been changed'
//     } catch(error) {
//       jiraAddComment idOrKey: "${issueKey}", comment: "${BUILD_URL} ERROR WHILE RELEASING ${error}"
//       currentBuild.result = 'FAILURE'
//     }
    
//   }

//   stage('Add comment to the JIRA issue'){
//     def comment = [ body: 'Dynamically added the issue key.' ]
//     jiraAddComment site: jiraSite, idOrKey: "${issueKey}", input: comment
//   }

//   stage('Finish Stage'){
//     echo 'Pipeline terminated successfully'
//   }
// }

node('jenkins-label'){
  def issueKey
  def jiraSite = 'JIRA-apigate'

  stage('Checkout SCM') {
    checkout scm

    // withCredentials([string(credentialsId: 'terraform-auth', variable: 'SVC_ACCOUNT_KEY')]){
    //   sh 'mkdir -p creds' 
    //   sh 'echo $SVC_ACCOUNT_KEY | base64 -d > ./creds/credentials.json'
    // }
  }
  
  stage('Checking Code'){
    issueKey = sh (
      script: 'git log --format=format:%s -1',
      returnStdout: true,
    ).trim()

    echo "${issueKey}" 
  }
  
  stage('Stage 1: Init & Plan'){
    try{
      sh 'terraform init -error'
    } catch(error) {
      jiraAddComment idOrKey: "${issueKey}", comment: "${BUILD_URL} ERROR WHILE RELEASING ${error}"
      currentBuild.result = 'FAILURE'
    }
  }  
}