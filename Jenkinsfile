pipeline {

    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Check Environment') {
            steps {
                sh '''
                    echo "===== Java ====="
                    java -version

                    echo "===== Git ====="
                    git --version

                    echo "===== Maven ====="
                    mvn -version

                    echo "===== Docker ====="
                    docker --version
                '''
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t todo-app:1.0 .'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                    docker rm -f todo-app-container || true
                    docker run -d --name todo-app-container -p 8081:8081 todo-app:1.0
                '''
            }
        }

    }
}
