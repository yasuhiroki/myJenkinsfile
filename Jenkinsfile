pipeline {
    agent any

    stages {
        stage('run') {
            steps {
                script {
                    def parallels = [:]
                    def bombIdx = (int)(Math.random()*20)
                    for (int i = 0; i < 20; ++i) {
                        parallels[i] = {
                            stage("${i}") {
                                input "刺す？"
                                if (i == bombIdx) {
                                    sh "docker restart myjenkinsfile_jenkins_1"
                                } else {
                                    echo "セーフ"
                                }
                            }
                        }
                    }
                    parallel(parallels)
                }
            }
        }
    }
}
