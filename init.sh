#!/bin/bash

K3S_TERRAFORM_DIR="terraform"

# Function to check and copy ansible inventory.yml
check_and_copy_ansible_inventory() {
    if [ ! -f "inventory.yml" ]; then
        cp "inventory-sample.yml" "inventory.yml"
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

echo "Checking ansible invenotry.yml..."
check_and_copy_ansible_inventory

echo "Checking terraform variables..."
check_and_copy_terraform_variables

# Install Ansible roles and collections
echo "Installing Ansible roles and collections from requirements.yml..."
ansible-galaxy install -r requirements.yml