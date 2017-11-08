pipeline {
    agent any

    stages {
        stage('run') {
            steps {
                script {
                    def parallels = [:]
                    def bombIdx = 3

                    def Closure getFunc(i) {
                        return {
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
                    for (int i = 0; i < 20; ++i) {
                        parallels[i] = getFunc(i)
                    }
                    parallel(parallels)
                }
            }
        }
    }
}
