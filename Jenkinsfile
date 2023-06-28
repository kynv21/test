pipeline {
    agent any

    stages {
        stage('clone') {
            steps {
                git 'https://github.com/kynv21/test.git'
            }
        }
    }
    post{
        success{
            echo "SUCCESSFUL"
        }
        failure{
            echo "FAILED"
        }
    }
}