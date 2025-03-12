pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9' 
    }

    environment {
        DOCKER_HUB_USER = 'aliciasingca' 
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
                bat 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-token', variable: 'DOCKER_HUB_PASSWORD')]) {
                    script {
                        def loginResult = bat returnStatus: true, script: """
                            echo %DOCKER_HUB_PASSWORD% | docker login -u %DOCKER_HUB_USER% --password-stdin
                        """
                        if (loginResult != 0) {
                            error "Docker login failed. Please check your credentials."
                        }
                    }
                }
            }
        }

        stage('Docker Build') {
            steps {
                bat "docker build -t %DOCKER_HUB_USER%/%IMAGE_NAME% ."
            }
        }

        stage('Docker Push') {
            steps {
                bat "docker push %DOCKER_HUB_USER%/%IMAGE_NAME%"
            }
        }

        stage('Deploy') {
            steps {
                bat "docker run -d -p 8080:8080 %DOCKER_HUB_USER%/%IMAGE_NAME%"
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
