# aws-terraform-bootstrap-acelerator
# Terraform Bootstrap Project

This Terraform project sets up essential infrastructure for managing and storing Terraform state and locking in AWS. It provisions an S3 bucket for storing the Terraform state and a DynamoDB table for state locking.

## Prerequisites

- **AWS Account**: You must have an AWS account and the necessary permissions to create the resources defined in this project.
- **Terraform**: Install Terraform CLI.
- **AWS CLI (Optional)**: While not strictly necessary, the AWS CLI is useful for managing and interacting with AWS resources.

## Setup

1. **Clone the Repository**

    ```bash
    git clone [your-repository-url]
    cd [your-repository-name]
    ```

2. **Initialize Terraform**

    ```bash
    terraform init
    ```

3. **Apply the Configuration**

    ```bash
    terraform apply
    ```
    Review the planned changes, and if everything looks correct, type `yes` to proceed with the creation of the resources.

4. **Optional: Destroy Resources**

    If you need to remove the created resources:
    
    ```bash
    terraform destroy
    ```
    Again, review the plan and type `yes` to proceed with the destruction of the resources. Be cautious, as this will delete your state bucket and lock table.

## Components

- **S3 Bucket**: Used for storing Terraform's remote state.
- **DynamoDB Table**: Used for state locking to prevent concurrent modifications.

## Important Notes

- **Region**: Ensure you're working in the desired AWS region. This Terraform setup creates resources in the region specified in the provider configuration.
- **State Management**: Be careful with the Terraform state. Mismanagement or deletion can disrupt your infrastructure management. Always ensure backups are in place.
