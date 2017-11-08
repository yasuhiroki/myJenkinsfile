pipeline {
    agent any

    stages {
        stage('run') {
            steps {
                script {
                    def parallels = [:]
                    def bombIdx = 3
                    for (int i = 0; i < 20; ++i) {
                        int j = i;
                        parallels[i] = {
                            stage("${j}") {
                                input "刺す？"
                                if (j == bombIdx) {
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

