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

3. **Setting Up AWS Credentials Locally**
**Setting Up AWS Credentials Locally

Before running Terraform commands that interact with AWS, you must configure your local environment with AWS credentials. This ensures that Terraform can authenticate and execute changes in your AWS account.

To set up your AWS credentials:

1. Open your terminal or command prompt.

2. Export your AWS access key and secret access key as environment variables:

    ```bash
    export AWS_ACCESS_KEY_ID=your_access_key
    export AWS_SECRET_ACCESS_KEY=your_secret_access_key
    ```

Replace `your_access_key` and `your_secret_access_key` with your actual AWS access key and secret access key, respectively.

> **Warning**: Be cautious when handling AWS access keys. Do not commit these keys to your repository, and avoid sharing them in plain text. Always consider using tools like AWS CLI's `aws configure` or AWS Secrets Manager for more secure management of credentials.


4. **Apply the Configuration**

    ```bash
    terraform apply
    ```
    Review the planned changes, and if everything looks correct, type `yes` to proceed with the creation of the resources.

5. **Optional: Destroy Resources**

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
