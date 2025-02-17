pipeline {
    agent any  // Runs on any available Jenkins agent

    tools {
        maven 'Maven 3.9.9'  // Use the Maven you configured in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                // Clones your GitHub repo
                git branch: 'main', url: 'https://github.com/AliciaSingca301336105/jenkins-lab2.git'
            }
        }
        
        stage('Build') {
            steps {
                // Build the Maven Web App
                bat 'mvn clean package'
            }
        }
        
        stage('Test') {
            steps {
                // Run tests (if you have any)
                bat 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                // Simulate deployment (e.g., copying the .war file)
                echo 'Deploying the web app...'
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