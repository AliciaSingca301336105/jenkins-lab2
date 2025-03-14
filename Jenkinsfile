pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9'  
    }

    environment {
        DOCKER_HUB_USER = 'aliciasingca'  //to check
        IMAGE_NAME = 'comp367-webapp'  
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/AliciaSingca301336105/jenkins-lab2.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                bat 'mvn clean package'  // Make sure Maven is installed in the PATH
            }
        }

        stage('Test') {
            steps {
                bat 'mvn test'  // Run tests
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-token-1', variable: 'DOCKER_TOKEN')]) {
                    bat """
                        echo %DOCKER_TOKEN% | docker login -u %DOCKER_HUB_USER% --password-stdin
                    """
                }
            }
        }

        stage('Docker Build') {
            steps {
                bat """
                    docker build -t %DOCKER_HUB_USER%/%IMAGE_NAME% .
                """
            }
        }

        stage('Docker Push') {
            steps {
                bat """
                    docker push %DOCKER_HUB_USER%/%IMAGE_NAME%
                """
            }
        }

        stage('Deploy') {
            steps {
                bat """
                    docker run -d -p 8080:8080 %DOCKER_HUB_USER%/%IMAGE_NAME%
                """
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
