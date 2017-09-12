pipeline {
  agent any
  stages {
    stage('Initializing') {
      steps {
        sh 'echo \'Starting\''
      }
    }
    stage('Run test'){
      steps {
        sh '''docker-compose build
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
docker-compose run web ./scripts/setup.sh rails test
'''
      }
    }
  }
 
}