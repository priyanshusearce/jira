node {
  stage ('Checkout') {
    checkout scm
  }
  
  stage ('Testing') {
    def issueKey = "env.BRANCH_NAME"
    echo issueKey
  }
}
