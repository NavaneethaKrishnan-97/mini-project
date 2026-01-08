pipeline {
    agent { label 'docker' }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/NavaneethaKrishnan-97/mini-project.git'
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
                docker run -dit --name demo-web-container -p 80:5000 demo-webapp
                '''
            }
        }
    }
}
