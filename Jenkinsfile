pipeline {
    agent any

    triggers { cron('H 9 * * *') }

    stages {
        stage('') {
            parallel {
                stage('isPrime?') {
                    steps {
                        sh 'factor $(date +%Y%m%d) | awk "NF==2" | grep -sq .'
                    }
                }

                stage('isNabeatsu?') {
                    steps {
                        sh 'date +%Y%m%d | grep -sq 3'
                        sh 'factor $(date +%Y%m%d) | grep -sq "\b3\b"'
                    }
                }
            }
        }
    }
}
