


####### CRIACAO DAS ROLES
data "aws_iam_policy_document" "iam_glue_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    
    principals {
      type        = "Service"
      identifiers = ["glue.amazonaws.com"]
    }
  }
}




resource "aws_iam_role" "glue_role_policy" {
  name               = "dados_relacionamento_role"
  assume_role_policy = data.aws_iam_policy_document.iam_glue_policy.json 

  inline_policy {
    name = "dados_relacionamento_inline_policy"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = [
            "glue:*",
            "s3:GetBucketLocation",
            "s3:ListObjects",
            "s3:ListBucket",
            "s3:ListAllMyBuckets",
            "s3:GetBucketAcl",
            "s3:ListBucket*",
            "s3:PutBucket",
            "s3:GetBucket",
            "s3:GetObject",
            "sqs:SendMessage",
            "kms:GenerateDataKey",
            "kms:Decrypt",  
            "kms:Encrypt",
            "kms:Create*",
            "kms:Describe*",
            "kms:Enable*",
            "kms:List*",
            "kms:Put*",
            "kms:Update*",
            "kms:Revoke*",
            "kms:Disable*",
            "kms:Get*",
            "kms:Delete*",
            "kms:TagResource",
            "kms:UntagResource",
            "kms:ScheduleKeyDeletion",
            "kms:CancelKeyDeletion",
            "rds-db:connect",
            "secretsmanager:GetSecretValue",
            "ec2:DescribeVpcEndpoints",
            "ec2:DescribeRouteTables",
            "ec2:CreateNetworkInterface",
            "ec2:DeleteNetworkInterface",				
            "ec2:DescribeNetworkInterfaces",
            "ec2:DescribeSecurityGroups",
            "ec2:DescribeSubnets",
            "ec2:DescribeVpcAttribute",
            "ec2:CreateTags",
            "ec2:DeleteTags",
            "iam:ListRolePolicies",
            "iam:GetRole",
            "iam:GetRolePolicy",
            "cloudwatch:PutMetricData",
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents",
            "logs:AssociateKmsKey" 
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
    })
  }
}



