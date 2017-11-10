pipeline {
    agent {
        node "mac"
    }

    triggers { cron('H * * * *') }

    stages {
        stage('Run') {
            steps {
                sh '/usr/local/bin/terminal-notifier -remove ALL'
            }
        }
    }
}
