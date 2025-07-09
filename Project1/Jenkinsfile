pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')       
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')   
    }

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Auto-apply without manual approval?')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/BeingAshu/Terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('Project1') {
                    bat 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('Project1') {
                    bat 'terraform plan -out=tfplan'
                    // Use PowerShell to redirect output on Windows to avoid issues with '>'
                    bat 'powershell -Command "terraform show -no-color tfplan | Out-File -Encoding ascii tfplan.txt"'
                }
            }
        }

        stage('Approval') {
            when {
                expression { return !params.autoApprove }
            }
            steps {
                script {
                    def plan = readFile('Project1/tfplan.txt')
                    input message: "Review and approve the Terraform plan",
                          parameters: [text(name: 'Terraform Plan Output', defaultValue: plan)]
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('Project1') {
                    bat 'terraform apply -input=false tfplan'
                }
            }
        }
    }
}
