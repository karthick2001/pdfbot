#!/bin/bash

# Function to install Docker
install_docker() {
    echo "Docker not found. Installing Docker..."
    sudo yum update -y
    sudo yum install -y docker
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker ec2-user
    echo "Docker installed successfully."
}

# Function to install AWS CLI
install_aws_cli() {
    echo "AWS CLI not found. Installing AWS CLI..."
    sudo yum install -y aws-cli
    echo "AWS CLI installed successfully."
}

# Check and install Docker if necessary
command -v docker &> /dev/null || install_docker && echo "Docker found."

# Check and install AWS CLI if necessary
command -v aws &> /dev/null || install_aws_cli && echo "AWS CLI is already installed."