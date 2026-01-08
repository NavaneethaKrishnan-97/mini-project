pipeline {
  agent any

  stages {
    stage('Build & Run Docker from GitHub') {
      steps {
        sh '''
        ssh -o StrictHostKeyChecking=no ubuntu@43.205.98.244 << 'EOF'
          rm -rf mini-project
          git clone https://github.com/NavaneethaKrishnan-97/mini-project.git

          cd mini-project

          docker rm -f demo-web-container || true
          docker build -t demo-webapp .
          docker run -dit -p 9092:80 --name demo-web-container demo-webapp
        EOF
        '''
      }
    }
  }
}
