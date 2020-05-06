pipeline{
  agent any
  stages{
    stage('Checkout code') {
      steps {
        script {
          // Checkout the repository and save the resulting metadata
          def scmVars = checkout([
            $class: 'GitSCM',
          ])

          // Display the variable using scmVars
          echo "scmVars.GIT_COMMIT"
          echo "${scmVars.GIT_COMMIT}"

          // Displaying the variables saving it as environment variable
          env.GIT_COMMIT = scmVars.GIT_COMMIT
          echo "env.GIT_COMMIT"
          echo "${env.GIT_COMMIT}"
        }

        // Here the metadata is available as environment variable
      }
    }
  }
}
