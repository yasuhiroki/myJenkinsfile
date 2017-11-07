pipeline {
    agent any
    stages {
        stage('isPrime?') {
            steps {
                echo 'factor $(date +%Y%m%d) | awk "NF==2" | grep -sq .'
            }
        }

        stage('isNabeatsu?') {
            steps {
                echo 'date +%Y%m%d | grep -sq 3'
                echo 'factor $(date +%Y%m%d) | grep -sq "\b3\b"'
            }
        }
    }
}
