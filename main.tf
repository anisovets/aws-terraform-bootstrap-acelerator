provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.s3-terraform-state-bucket-name
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name           = var.aws_dynamodb_table
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_iam_user" "terraform_user" {
  name = var.service_user
  path = "/system/"
}

resource "aws_iam_policy" "iam_policy" {
  name        = "iam_user_creation_policy"
  description = "Policy that grants specific IAM permissions."

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "iam:CreateUser",
          "iam:CreateAccessKey",
          "iam:PassRole",
          "iam:PutUserPolicy",
          "iam:AddUserToGroup",
          "iam:GetUser",
          "iam:DeleteUserPolicy",
          "iam:ListAccessKeys",
          "iam:GetUserPolicy"
        ],
        Effect   = "Allow",
        Resource = "*"
      }, 
      {
        Effect =  "Allow",
        Action = [
        "s3:ListBucket",
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": "arn:aws:s3:::yaru-labs-terraform-state"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attachment" {
  user       = aws_iam_user.terraform_user.name
  policy_arn = aws_iam_policy.iam_policy.arn
}