pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'aliciansingca/comp367-webapp'
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials'  // Set in Jenkins credentials
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/AliciaSingca301336105/jenkins-lab2.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Docker Push') {
            steps {
                sh "docker push ${DOCKER_IMAGE}"
            }
        }

        stage('Cleanup') {
            steps {
                sh "docker rmi ${DOCKER_IMAGE}"
            }
        }
    }
}
