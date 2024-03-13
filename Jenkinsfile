pipeline {
    agent {
        docker {
            image 'abhishekf5/maven-abhishek-docker-agent:v1'
            args '--user root -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    environment {
        DOCKER_IMAGE = "shaiksaiteja/final-sem-cicd:${BUILD_NUMBER}"
    }

    stages {
        stage('Git Checkout') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/shaiksaiteja/finalproject.git'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'saiteja_jen_docker', usernameVariable: 'DOCKERHUB_CREDENTIALS_USR', passwordVariable: 'DOCKERHUB_CREDENTIALS_PSW')]) {
                    sh "docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    def dockerImage = docker.image("${DOCKER_IMAGE}")
                    dockerImage.push()
                }
            }
        }

        stage('Update Deployment File in K8S manifest & push to Repo') {
            environment {
                GIT_REPO_NAME = "finalproject"
                GIT_USER_NAME = "shaiksaiteja"
            }
            steps {
                script {
                    // Update the deployment file
                    sh "sed -i 's/image: shaiksaiteja\\/final-sem-cicd:\${current_tag}/image: shaiksaiteja\\/final-sem-cicd:${BUILD_NUMBER}/g' Kubernetes/deployment.yml"
                    
                    // Commit and push the changes to the repository
                    withCredentials([string(credentialsId: 'github', variable: 'GITHUB_TOKEN')]) {
                        sh '''
                            git config user.email "shaiksaiteja7095@gmail.com"
                            git config user.name "saiteja"
                            git add Kubernetes/deployment.yml
                            git commit -m "Update deployment image to version ${BUILD_NUMBER}"
                            git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:main
                        '''
                    }
                }
            }
        }
    }
}
