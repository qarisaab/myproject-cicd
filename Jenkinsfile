pipeline {
    agent any 
        stages {
            stage("build") {
                steps {
                    script {
                        echo "building the application ...."
                        sh 'chmod +x gradlew'
                        sh './gradlew build'
                    }
                }
            }
            stage("building the docker image") {
                steps {
                    script {
                        echo "building the docker image"
                        withCredentials([usernamePassword(credentialsId: "DockerID", passwordVariable: "password", usernameVariable: "username")]) {
                            sh "docker build -t qarisaab/gradleapp ."
                            sh "echo $PASS | docker login -u $USER --password-stdin"
                            sh "docker push qarisaab/gradleapp"
                        }
                    }
                }
            }
            stage("deploy") {
                steps {
                    script {
                        echo "deploying the application ...."
                    }
                }
            }
       }
}
