pipeline {
    agent any

    stages {
        stage('Lint') {
            steps {
                sh 'make lint'
            }
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'make build'
            }
        }
    }

    stages {
        stage('Test') {
            steps {
                sh 'make test'
            }
        }
    }

    stages {
        stage('Upload to repository') {
            steps {
                sh 'make upload'
            }
        }
    }

    stages {
        stage('Deploy') {
            steps {
                sh 'make deploy'
            }
        }
    }
    stages {
        stage('Clean') {
            steps {
                sh 'make clean'
            }
        }
    }
}

