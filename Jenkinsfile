pipeline {
  agent any

  stages {

    stage('Clone Repo') {
      steps {
        git url: 'https://github.com/NavaneethaKrishnan-97/mini-project.git', branch: 'master'
      }
    }

    stage('Copy files to Docker Host') {
     steps {
    sh '''
    rsync -av --delete \
      --exclude='.git' \
      --exclude='.gitignore' \
      -e "ssh -i /var/lib/jenkins/mykey.pem -o StrictHostKeyChecking=no" \
      ./ ubuntu@15.206.145.105:/home/ubuntu/mini-project/
    '''
  }
    }

    stage('Build Docker Image on Docker Host') {
      steps {
        sh '''
        ssh -i /var/lib/jenkins/mykey.pem ubuntu@15.206.145.105 "cd /home/ubuntu/mini-project && docker build -t demo-webapp ."
        '''
      }
    }

    stage('Run Docker Container on Docker Host') {
      steps {
    sh '''
    ssh -i /var/lib/jenkins/mykey.pem ubuntu@15.206.145.105 "
      docker ps -q --filter name=demo-web-container | xargs -r docker rm -f
      docker run -d --name demo-web-container -p 8080:80 demo-webapp
    "
    '''
     }
    }
  }
}
