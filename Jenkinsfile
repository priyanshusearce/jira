node('jenkins-slave') {

  def issueKey
  def jiraSite = 'JIRA-apigate'
  
  stage('Checkout SCM') {
    checkout scm

    withCredentials([string(credentialsId: 'terraform-auth', variable: 'SVC_ACCOUNT_KEY')]){
      sh 'mkdir -p creds' 
      sh 'echo $SVC_ACCOUNT_KEY | base64 -d > ./creds/credentials.json'
    }
  }
  
  stage('Checking Code'){
    issueKey = sh (
      script: 'git log --format=format:%s -1',
      returnStdout: true,
    ).trim() 
  }

  stage('Stage 1: Init & Plan'){
    // Terraform Initialization
    sh 'terraform init'

    // Applying terraform plan and storing it in a variable for comment
    terraform_plan = sh script: 'terraform plan -out myplan', returnStdout: true
    jiraAddComment site: jiraSite, idOrKey: "${issueKey}", input: terraform_plan
    
  }

  stage('Stage 2: Apply'){
    
    // Applying terraform apply and storing it in a variable for comment
    terraform_apply = sh script: 'terraform apply -input=false myplan', returnStdout: true 
    jiraAddComment site: jiraSite, idOrKey: "${issueKey}", input: terraform_plan
  }

  stage('Stage 4: Destroy'){
    sh 'terraform destroy -auto-approve'
  }

  stage('JIRA - Change the Status') {
    def transitionInput = [
        transition: [
          id: 31
        ]
      ]
      jiraTransitionIssue site: jiraSite, idOrKey: "${issueKey}", input: transitionInput

      echo 'Task Status has been changed'
  }

  stage('Add comment to the JIRA issue'){
    def comment = [ body: 'Completed !!!' ]
    jiraAddComment site: jiraSite, idOrKey: "${issueKey}", input: comment
  }
}