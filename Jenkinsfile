pipeline {
    agent any

    stages {
       stage('Prepare Workspace') {
            steps {
                // Checkout the Git repository to Jenkins workspace
                git branch: 'main', url: 'https://github.com/Shanmugaraja-18/dockerassessment.git'

                // Copy Dockerfile and application files into Jenkins workspace
                sh 'cp Dockerfile .'
                sh 'cp Hello.class .'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image
                script {
                    docker.build("my-java-app") // Change "my-java-app" to the desired image name
                }
            }
        }

        stage('Publish to Docker Repository') {
            steps {
                // Publish Docker image to Docker repository
                script {
                    docker.withRegistry('https://hub.docker.com/', '8918205f-aad9-4308-88ee-b5ebe24a1dc9') { // Change "8918205f-aad9-4308-88ee-b5ebe24a1dc9" to your Docker credentials ID
                        docker.image("my-java-app").push('latest') // Change "my-java-app" to the desired image name
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Create Docker container using the published image
                sh 'docker run --name my-java-app-container -d my-java-app:latest' // Change "my-java-app" to the desired image name
            }
        }
    }
}
