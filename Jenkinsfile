pipeline {
    agent any

    // Acá le decimos a Jenkins que busque las credenciales guardadas
    environment {
        DOCKERHUB_TOKEN = credentials('dockerhub-creds')
    }

    stages {

        // Primera etapa: bajamos el código de GitHub a Jenkins
        stage('Clonar repositorio') {
            steps {
                checkout scm
            }
        }

        // Segunda etapa: construimos y subimos la imagen a Docker Hub
        stage('Build y Push a Docker Hub') {
            steps {
                sh '''
                    echo "Iniciando push..."
                    docker login -u justing0 -p ${DOCKERHUB_TOKEN_PSW}
                    docker buildx build --platform linux/amd64 -t justing0/hello-python:latest --push .
                '''
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
