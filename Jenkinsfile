pipeline {
    agent any

    tools {
        maven "M3"
    }

    stages {
        stage('prepare') {
            steps {
                
                git branch: 'main', url: 'https://github.com/quick-aib/debts.git'

            }
        }
        stage('terraform init') {
            steps {
                
               
                // Run Maven on a Unix agent.
                sh "terraform init"

                
            }
        }
        stage('terraform plan') {
            steps {
                
               sh "terraform plan -out terraform.plan"

            }
        }
        stage('terraform apply') {
            steps {
                 sh "terraform apply terraform.plan"
            }
        }
    }
}
