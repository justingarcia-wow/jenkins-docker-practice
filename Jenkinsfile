pipeline {
    agent any

    stages {
        stage('Clonar repositorio') {
            steps {
                checkout scm
            }
        }

        stage('Build imagen Docker') {
            steps {
                sh 'docker build -t hello-python:latest .'
            }
        }
    }

    post {
        success {
            echo 'Imagen construida exitosamente'
        }
        failure {
            echo 'Algo falló'
        }
    }
}