node {
  stage ('Checkout') {
    checkout scm
  }
  
  stage ('Testing') {
    sh 'git rev-parse HEAD > commit'
    def commit = readFile('commit').trim()
  }
}
