pipeline {
    // Acá le decimos a Jenkins que use cualquier máquina disponible para correr el pipeline
    agent any

    stages {

        // Primera etapa: bajamos el código de GitHub a Jenkins
        stage('Clonar repositorio') {
            steps {
                // scm se conecta automáticamente al repo que configuramos en el job
                checkout scm
            }
        }

        // Segunda etapa: construimos la imagen Docker con nuestro código
        stage('Build imagen Docker') {
            steps {
                // -t le pone nombre a la imagen, el punto busca el Dockerfile en la carpeta actual
                sh 'docker buildx build --platform linux/amd64 -t justing0/hello-python:latest --push .'
            }
        }

        // Tercera etapa: subimos la imagen a Docker Hub pa que quede guardada en internet
        stage('Push a Docker Hub') {
            steps {
                // Login directo con el token — temporal solo para probar
                sh 'docker login -u justing0 -p dckr_pat_Cp48FdPKfj-76paEBamKNw0v0vE'
                sh 'docker push justing0/hello-python:latest'
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
