pipeline {
    agent { label 'docker-agent' }  // use your Linux agent

    stages {
        stage('Checkout') {
            steps {
                // Runs on Linux agent, uses Linux Git
                git url: 'https://github.com/NavaneethaKrishnan-97/mini-project.git'
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
                docker run -dit --name demo-web-container -p 9091:80 demo-webapp
                '''
            }
        }
    }
}
