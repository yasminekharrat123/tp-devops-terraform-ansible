pipeline {
    agent any

    environment {
        DOCKER_REGISTRY_USER     = credentials('docker-registry-user')       
        DOCKER_REGISTRY_PASSWORD = credentials('docker-registry-password')   
        AWS_ACCESS_KEY_ID        = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY    = credentials('aws-secret-access-key')
        EC2_SSH_USER             = credentials('ec2-ssh-user')
        EC2_SSH_KEY_PATH         = credentials('ec2-ssh-key-path') 
        EC2_PRIV_SSH_PATH        = credentials('ec2_priv_ssh_key_path')        
        DB_PASSWORD              = credentials('db-password')
        PERSONAL_IP              = credentials('my-ip')  

        DOCKER_REGISTRY          = "docker.io"
        DOCKER_REGISTRY_IMAGE    = "ykharrat848/test-express-app"
        DOCKER_IMAGE_TAG         = "latest"
    }

    stages {
        stage('Prepare Terraform Vars') {
            steps {
                script {
                    writeFile file: 'Terraform/terraform.tfvars', text: """
                        key_name        = "my-ssh-key"
                        public_key_path = "${env.EC2_SSH_KEY_PATH}"
                        my_ip           = "${env.PERSONAL_IP}"
                    """
                }
            }
        }

        stage('Terraform Init & Apply') {
            steps {
                dir('Terraform') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                    sh 'terraform output -json > ../Ansible/tf_outputs.json'
                }
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                dir('Ansible') {
                    sh 'ansible-playbook -i inventory/inventory.yml playbook.yml'
                }
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed.'
        }
        success {
            echo 'Pipeline completed successfully.'
        }
    }
}
