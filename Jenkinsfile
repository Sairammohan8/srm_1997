pipeline {
    agent any
    
    environment {
        TF_VERSION = "1.0.0"
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout your source code repository
                git 'https://github.com/your/repository.git'
            }
        }
        stage('Install Terraform') {
            steps {
                // Download and install Terraform
                sh "curl -o terraform.zip https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip"
                sh "unzip terraform.zip"
                sh "mv terraform /usr/local/bin/"
                sh "terraform --version"
            }
        }
        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                sh "terraform init"
            }
        }
        stage('Terraform Plan') {
            steps {
                // Generate and review Terraform plan
                sh "terraform plan"
            }
        }
        stage('Terraform Apply') {
            steps {
                // Apply Terraform changes
                sh "terraform apply -auto-approve"
            }
        }
    }
    post {
        always {
            // Clean up Terraform files
            sh "rm -rf .terraform terraform.zip"
        }
    }
}
