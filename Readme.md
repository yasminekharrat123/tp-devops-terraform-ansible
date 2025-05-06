# Environment Variables

Export the following environment variables:

```bash
export DOCKER_REGISTRY_USER="ykharrat848"
export DOCKER_REGISTRY="docker.io"
export DOCKER_REGISTRY_PASSWORD=

export DOCKER_REGISTRY_IMAGE="ykharrat848/test-express-app"
export DOCKER_IMAGE_TAG="latest"

export EC2_SSH_USER=
export EC2_SSH_KEY_PATH=

export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export DB_PASSWORD=
```
# Terraform specific Variables

create a terraform.tfvars file under Terraform/

and add to it 
```bash
key_name        = "your-ssh-key"
public_key_path = The ssh path of your public rsa key generated locally
my_ip = your ip


```


# Steps to Run

```bash
cd Terraform
terraform init
terraform apply
terraform output -json > ../Ansible/tf_outputs.json

cd ..
cd Ansible
ansible-playbook -i inventory/inventory.yml playbook.yml
```
