pipeline {
    agent { label 'docker-agent' }

    options { skipDefaultCheckout() }

    stages {
        stage('Clone Repo') {
            steps {
                sh 'git clone https://github.com/NavaneethaKrishnan-97/mini-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t demo-webapp ./mini-project'
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
