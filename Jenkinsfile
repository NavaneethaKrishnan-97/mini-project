pipeline {
  agent any

  stages {
    stage('Clone Repo') {
      steps {
        git 'https://github.com/NavaneethaKrishnan-97/mini-project.git'
      }
    }
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t demo-webapp .'
      }
    }
    stage('Run Docker Container') {
      steps {
        sh '''
        docker rm -f demo-web-container || true
        docker run -dit --name demo-web-container -p 8080:80 demo-webapp
        '''
      }
    }
  }
}
