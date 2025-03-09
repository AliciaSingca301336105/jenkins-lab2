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
                script {
                    // Ensure Maven is used from the correct location or install it if needed
                    sh 'mvn clean package'
                }
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
                script {
                    // Build the Docker image
                    sh "docker build -t ${DOCKER_IMAGE}:latest ."
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    sh "docker push ${DOCKER_IMAGE}:latest"
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    // Clean up the local Docker image
                    sh "docker rmi ${DOCKER_IMAGE}:latest"
                }
            }
        }
    }
}
