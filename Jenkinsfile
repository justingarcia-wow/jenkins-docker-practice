// Llamamos la librería compartida
@Library('mi-libreria') _

pipeline {
    agent any

    stages {

        // Primera etapa: clonamos el repo
        stage('Clonar repositorio') {
            steps {
                checkout scm
            }
        }

        // Segunda etapa: llamamos la función de la librería
        stage('Build y Push') {
            steps {
                script {
                    buildAndPush('justing0/hello-python')
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