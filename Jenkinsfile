pipeline {
  agent any

  stages {
    stage('Build Docker Image') {
      steps {
        bat 'docker build -t demo-webapp .'
      }
    }

    stage('Run Docker Container') {
      steps {
        bat '''
          docker rm -f demo-web-container || exit 0
          docker run -d --name demo-web-container -p 8080:80 demo-webapp
        '''
      }
    }
  }
}
