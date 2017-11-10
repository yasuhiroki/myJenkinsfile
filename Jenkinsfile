pipeline {
    agent mac

    triggers { cron('H * * * *') }

    stages {
        stage('Run') {
            steps {
                sh 'terminal-notifier -remove ALL'
            }
        }
    }
}
