#!/bin/bash

K3S_ANSIBLE_REPO_URL="https://github.com/MahdadGhasemian/k3s-ansible.git"
K3S_ANSIBLE_REPO_DIR="k3s-ansible"
K3S_TERRAFORM_DIR="terraform"

# Function to clone the K3S_ANSIBLE Git repository
clone_k3s_ansible_repo() {
    # Clone the repository if it doesn't exist
    if [ ! -d "$REPO_DIR" ]; then
        git clone $K3S_ANSIBLE_REPO_URL
    else
        echo "Repository already exists. Pulling latest changes..."
        cd $REPO_DIR && git pull
    fi
}

# Function to check and copy ansible inventory.yml
check_and_copy_ansible_inventory() {
    if [ ! -f "$K3S_ANSIBLE_REPO_DIR/inventory.yml" ]; then
        cp "$K3S_ANSIBLE_REPO_DIR/inventory-sample.yml" "$K3S_ANSIBLE_REPO_DIR/inventory.yml"
        echo "Copied inventory-sample.yml to inventory.yml"
    else
        echo "inventory.yml already exists."
    fi
}

# Function to check and copy terraform terraform.tfvars
check_and_copy_terraform_variables() {
    if [ ! -f "$K3S_TERRAFORM_DIR/terraform.tfvars" ]; then
        cp "$K3S_TERRAFORM_DIR/terraform.tfvars.sample" "$K3S_TERRAFORM_DIR/terraform.tfvars"
        echo "Copied terraform.tfvars.sample to terraform.tfvars"
    else
        echo "terraform.tfvars already exists."
    fi
}

# Main script execution

echo "Cloning The K3A_ANSIBLE Git repository..."
clone_k3s_ansible_repo

echo "Checking ansible invenotry.yml..."
check_and_copy_ansible_inventory

echo "Checking terraform variables..."
check_and_copy_terraform_variables