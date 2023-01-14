pipeline {
    agent { label 'maven-label' }
    tools {
        maven "M3"
    }

    stages {
        stage('prepare') {
            steps {

                git branch: 'main', url: 'https://github.com/quick-aib/debts.git'
                sh "mvn -s settings.xml -Dmaven.test.failure.ignore=true clean deploy"

            }

            post {
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
                }
            }
        }
     stage('Build') {
        steps {
            git branch: 'master', url: 'https://github.com/qfitsolutions/docker.git'
            sh "docker build -t abc ."
        }
    }
  }
}
