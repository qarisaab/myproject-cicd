pipeline {
    agent any 
        stages {
            stage("build") {
                steps {
                    script {
                        echo "building the application ...."
                        sh 'chmod +x gradlew'
                        sh './gradlew'
                    }
                }
            }
            stage("building the docker image") {
                steps {
                    script {
                        echo "building the docker image"
                        withCredentials([usernamePassword(credentialsId: "DockerID", passwordVariable: "PASS", usernameVariable: "USER")]) {
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
