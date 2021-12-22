pipeline {
    agent any

    stages {
        stage('Lint') {
            steps {
                sh 'make lint'
            }
        }
        stage('Build') {
            steps {
                sh 'make build'
            }
        }
        stage('Test') {
            steps {
                sh 'make test'
            }
        }
        stage('Upload to repository') {
            steps {
                sh 'make upload'
            }
        }
        stage('Deploy') {
            steps {
                sh 'make deploy'
            }
        }
        stage('Clean') {
            steps {
                sh 'make clean'
            }
        }
    }

}

