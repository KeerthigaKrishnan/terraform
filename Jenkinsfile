pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.2.0'
        }
    }
    environment {
            AWS_ACCESS_KEY_ID=credentials('JENKINS_AWS_ACCESS_KEY_ID')
            AWS_SECRET_ACCESS_KEY=credentials('JENKINS_AWS_SECRET_ACCESS_KEY')
        }

    parameters {
        choice(
            choices: ['plan' , 'apply', 'validate', 'destroy'],
            description: 'Terraform action to apply',
            name: 'action')
    }

    stages {

        stage('checkout code') {
        steps {
            checkout scm
            sh 'ls'
            sh 'cp -r . /tmp'
        }
    }
        stage('init') {
            steps {
                sh 'pwd'
                sh 'terraform version'
                sh 'terraform init'
            }
        }

        stage('plan') {
            when {
                expression { params.action == 'plan' }
            }
            steps {
		sh 'terraform plan'
            }
        }

      }
  }
