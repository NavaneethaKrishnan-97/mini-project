pipeline {
  agent any

  stages {
    stage('Clone Repo') {
      steps {
        git 'https://github.com/NavaneethaKrishnan-97/mini-project.git'
      }
    }

    stage('Build & Run Docker on Docker Server') {
      steps {
        sh '''
        ssh -o StrictHostKeyChecking=no ubuntu@43.205.98.244 << EOF
        cd mini-project
          docker rm -f demo-web-container || true
          docker build -t demo-webapp .
          docker run -dit --name demo-web-container -p 9092:80 demo-webapp
        EOF
        '''
      }
    }
  }
}
