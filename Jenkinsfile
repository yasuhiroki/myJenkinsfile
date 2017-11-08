pipeline {
    agent any

    stages {
        stage('run') {
            steps {
                script {
                    for (int i = 0; i < 20; ++i) {
                        stage(i) {
                            echo "hoge ${i}"
                        }
                    }
                }
            }
        }
    }
}


