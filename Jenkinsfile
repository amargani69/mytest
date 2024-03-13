pipeline {
    agent {
        environment {
        DOCKER_IMAGE = "shaiksaiteja/final-sem-cicd:${BUILD_NUMBER}"
        }
        docker {
            image 'abhishekf5/maven-abhishek-docker-agent:v1'
            args '--user root -v /var/run/docker.sock:/var/run/docker.sock'
        }
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
            environment {
                DOCKER_IMAGE = "shaiksaiteja/final-sem-cicd:${BUILD_NUMBER}"
                REGISTRY_CREDENTIALS = credentials('docker-cred')
            }
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    def dockerImage = docker.image("${DOCKER_IMAGE}")
                    docker.withRegistry('https://index.docker.io/v1/', "docker-cred") {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Update Deployment File in K8S manifest & push to Repo') {
            environment {
                GIT_REPO_NAME = "finalproject"
                GIT_USER_NAME = "shaiksaiteja"
            }
            steps {
                withCredentials([string(credentialsId: 'github', variable: 'GITHUB_TOKEN')]) {
                    sh '''
                        git config user.email "shaiksaiteja7095@gmail.com"
                        git config user.name "saiteja"
                        BUILD_NUMBER=${BUILD_NUMBER}
                        sed -i '' "s/${current_tag}/${BUILD_NUMBER}/g" Kubernetes/deployment.yml
                        git add Kubernetes/deployment.yml
                        git commit -m "Update deployment image to version ${BUILD_NUMBER}"
                        git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:main
                    '''
                }
            }
        }
    }
}
