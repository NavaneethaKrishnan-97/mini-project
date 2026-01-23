pipeline {
  agent any

  stages {
    stage('Build & Run Docker from GitHub') {
      steps {
        sh '''
ssh -o StrictHostKeyChecking=no ubuntu@3.110.197.178 <<'EOF'
rm -rf mini-project
git clone https://github.com/NavaneethaKrishnan-97/mini-project.git
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
