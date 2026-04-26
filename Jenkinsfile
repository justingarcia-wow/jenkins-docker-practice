pipeline {
    agent any

    stages {

        stage('Clonar repositorio') {
            steps {
                checkout scm
            }
        }

        stage('Build y Push a Docker Hub') {
            steps {
                // Usamos las credenciales guardadas en Jenkins, nunca la contraseña directa
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    // Login a Docker Hub con el token
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    // Construye para Linux 64 bits y sube directo a Docker Hub
                    sh 'docker buildx build --platform linux/amd64 -t justing0/hello-python:latest --push .'
                }
            }
        }
    }

    post {
        success {
            echo 'Imagen subida exitosamente a Docker Hub'
        }
        failure {
            echo 'Algo falló'
        }
    }
}
