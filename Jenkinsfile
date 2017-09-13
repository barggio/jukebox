pipeline {
  agent any
  environment {
    DOCKER_PASSWORD = credentials('DOCKER_HUB')
  }  
  stages {
    stage('greeting') {
      steps {
        sh '''echo "hello moon"
'''
      }
    }
    stage('run test') {
      steps {
        sh '''docker-compose build
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
docker-compose run web ./scripts/setup.sh rails test
'''
      }
    }
    stage('docker clean') {
      steps {
        sh '''
          docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
          docker system prune -f
'''
      }
    }

    stage('Build container') {
      steps {
        sh '''
          docker build -t barggio/jukebox:$BUILD_NUMBER .
'''
      }
    }
    stage('Login and push to Docker Hub') {
      steps {
        sh '''
          docker login -u barggio -p $DOCKER_HUB
          docker push barggio/jukebox:$BUILD_NUMBER
'''
      }
    }    
  }
}
