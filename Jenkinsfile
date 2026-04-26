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
                sh 'docker build -t justing0/hello-python:latest .'
            }
        }

        // Tercera etapa: subimos la imagen a Docker Hub pa que quede guardada en internet
        stage('Push a Docker Hub') {
            steps {
                // Acá usamos las credenciales que guardamos en Jenkins, nunca la contraseña directa
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    // Iniciamos sesión en Docker Hub usando el token
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    // Subimos la imagen al repositorio de justing0 en Docker Hub
                    sh 'docker push justing0/hello-python:latest'
                }
            }
        }
    }

    // Esto se ejecuta siempre al final, salga bien o mal
    post {
        success {
            echo 'Imagen subida exitosamente a Docker Hub'
        }
        failure {
            echo 'Algo falló'
        }
    }
}