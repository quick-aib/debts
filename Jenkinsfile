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
               dir("terraform") {
                  sh "terraform init"
               }
            }
        }
        stage('terraform plan') {
            steps {
                dir("terraform") {
                   sh "terraform plan -var-file=terraform.tfvars -out terraform.plan"
                }

            }
        }
        stage('terraform apply') {
            steps {
                dir("terraform") {
                   sh "terraform apply terraform.plan"
                }
            }
        }
    }
}
