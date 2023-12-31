variable "region" {
    description = "The AWS Region"
    type = string
    default = "us-east-1"
}


variable "s3-terraform-state-bucket-name" {
    description = "S3 bucket for storing the Terraform state"
    type = string
    default = "yaru-labs-terraform-state-bucket"
}

variable "aws_dynamodb_table" {
    description = "DynamoDB table name for state locking"
    type = string
    default = "TerraformLocks"
}

variable "service_user" {
    description = "IAM Service User Name"
    type = string
    default = "serv_user"
}

variable "aws_account_id" {
    description = "The AWS Account ID"
    type = string
    default = "389969266741"
}