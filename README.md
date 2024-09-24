# Jenkins CI/CD Terraform Project

## Overview

This project sets up a Jenkins CI/CD server on AWS using Terraform. Jenkins is a popular open-source automation server that helps automate the parts of software development related to building, testing, and deploying, facilitating continuous integration and continuous delivery (CI/CD).

## Purpose

The purpose of this project is to demonstrate the use of Infrastructure as Code (IaC) to automate the deployment of a Jenkins server on AWS. By using Terraform, we can define and provision the infrastructure required for Jenkins in a repeatable and consistent manner.

## Business Problems Solved

- **Automation**: Automates the setup of Jenkins, reducing manual effort and human error.
- **Scalability**: Easily scalable infrastructure to accommodate growing CI/CD needs.
- **Consistency**: Ensures consistent environment setup across different stages (development, staging, production).
- **Cost Efficiency**: Optimises resource usage and reduces costs by automating infrastructure management.

## Project Structure

### Files and Their Purpose

- **main.tf**: 
  - Defines the AWS provider and the Jenkins module.
  - Specifies the resources required for the Jenkins server, including EC2 instance and security groups.

- **variables.tf**: 
  - Declares the variables used in the Terraform configuration.
  - Variables include `key_name`, `my_ip`, and `bucket_suffix`.

- **outputs.tf**: 
  - Defines the outputs of the Terraform configuration.
  - Outputs include the Jenkins URL and S3 bucket name.

- **modules/jenkins/main.tf**: 
  - Contains the main configuration for the Jenkins module.
  - Defines the EC2 instance, security groups, and S3 bucket for Jenkins artifacts.

- **modules/jenkins/variables.tf**: 
  - Declares the variables specific to the Jenkins module.

- **modules/jenkins/outputs.tf**: 
  - Defines the outputs specific to the Jenkins module.

- **.gitignore**: 
  - Specifies files and directories to be ignored by Git.
  - Includes `.terraform/`, `terraform.tfstate`, `terraform.tfstate.backup`, and `terraform.tfvars`.

### Important Note

- **terraform.tfvars**: 
  - This file is not included in the repository as it contains sensitive information.
  - You need to create this file manually with the following content:
    ```hcl
    key_name      = "your-key-pair-name"  # Replace with your own name
    my_ip         = "your-ip-address/32"  # Replace woth your own ip address
    bucket_suffix = "unique-suffix"       # Replace with your owne unique suffix name
    ```