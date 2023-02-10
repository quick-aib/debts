pipeline {
    agent { label 'maven-label' }
    stages {
        stage('prepare') {
            steps {

                git branch: 'test-ansible', url: 'https://github.com/quick-aib/debts.git'
                sh "ansible-playbook -i inventory site.yml"

            }
        }
     
  }
}
