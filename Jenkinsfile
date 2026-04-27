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
        sh """
            curl -s -X POST https://api.telegram.org/bot8627044263:AAH-w3w2Ixub5hcrk2JEoqo2bQ6t6BQB1PI/sendMessage \
            -d chat_id=1221106616 \
            -d text='✅ Pipeline exitoso: hello-python fue construida y subida a Docker Hub'
        """
    }
    failure {
        sh """
            curl -s -X POST https://api.telegram.org/bot8627044263:AAH-w3w2Ixub5hcrk2JEoqo2bQ6t6BQB1PI/sendMessage \
            -d chat_id=1221106616 \
            -d text='❌ Pipeline fallido: algo salió mal en hello-python'
        """
    }
}
}
