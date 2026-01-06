pipeline {
    agent any

    stages {

        stage('Clone Repo') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/NavaneethaKrishnan-97/mini-project.git'
            }
        }

        stage('Build Docker Image on Docker Host') {
            steps {
                sh '''
                ssh -i /var/lib/jenkins/mykey.pem \
                    ubuntu@15.206.145.105 << EOF

                  docker build -t demo-webapp .
                EOF
                '''
            }
        }

        stage('Run Docker Container on Docker Host') {
            steps {
                sh '''
                ssh -i /var/lib/jenkins/mykey.pem \
                    ubuntu@15.206.145.105 << EOF

                  docker rm -f demo-web-container || true
                  docker run -dit --name demo-web-container -p 8080:80 demo-webapp
                EOF
                '''
            }
        }
    }
}
