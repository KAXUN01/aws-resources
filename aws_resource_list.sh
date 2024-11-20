#!/bin/bash

###############################################################################
# Author: Kasun madhushan
# Version: v1.0

# Script to automate the process of listing all the resources in an AWS account
#
# Below are the services that are supported by this script:
# 1. EC2
# 2. RDS
# 3. S3
# 4. CloudFront
# 5. VPC
# 6. IAM
# 7. Route53
# 8. CloudWatch
# 9. CloudFormation
# 10. Lambda
# 11. SNS
# 12. SQS
# 13. DynamoDB
# 14. EBS
# 15. Elastic Beanstalk
# 16. ElastiCache
# 17. EKS
# 18. SSM
# 19. Secrets Manager
#
# The script will prompt the user to enter the AWS region and the service for which the resources need to be listed.
#
# Usage: ./aws_resource_list.sh <aws_region> <aws_service>
# Example: ./aws_resource_list.sh us-east-1 ec2
###############################################################################

# Check if the required number of arguments are passed
if [ $# -ne 2 ]; then
    echo "Usage: ./aws_resource_list.sh <aws_region> <aws_service>"
    echo "Example: ./aws_resource_list.sh us-east-1 ec2"
    exit 1
fi

# Assign the arguments to variables and convert the service to lowercase
aws_region=$1
aws_service=$(echo "$2" | tr '[:upper:]' '[:lower:]')

# Check if the AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install the AWS CLI and try again."
    exit 1
fi

# Check if the AWS CLI is configured
if [ ! -f ~/.aws/config ] || [ ! -f ~/.aws/credentials ]; then
    echo "AWS CLI is not configured. Please configure the AWS CLI and try again."
    exit 1
fi

# Function to list resources based on the service
list_resources() {
    case $1 in
        ec2)
            echo "Listing EC2 Instances in $aws_region"
            aws ec2 describe-instances --region "$aws_region"
            ;;
        rds)
            echo "Listing RDS Instances in $aws_region"
            aws rds describe-db-instances --region "$aws_region"
            ;;
        s3)
            echo "Listing S3 Buckets (region-independent)"
            aws s3api list-buckets
            ;;
        cloudfront)
            echo "Listing CloudFront Distributions (region-independent)"
            aws cloudfront list-distributions
            ;;
        vpc)
            echo "Listing VPCs in $aws_region"
            aws ec2 describe-vpcs --region "$aws_region"
            ;;
        iam)
            echo "Listing IAM Users (region-independent)"
            aws iam list-users
            ;;
        route53)
            echo "Listing Route53 Hosted Zones (region-independent)"
            aws route53 list-hosted-zones
            ;;
        cloudwatch)
            echo "Listing CloudWatch Alarms in $aws_region"
            aws cloudwatch describe-alarms --region "$aws_region"
            ;;
        cloudformation)
            echo "Listing CloudFormation Stacks in $aws_region"
            aws cloudformation describe-stacks --region "$aws_region"
            ;;
        lambda)
            echo "Listing Lambda Functions in $aws_region"
            aws lambda list-functions --region "$aws_region"
            ;;
        sns)
            echo "Listing SNS Topics (region-independent)"
            aws sns list-topics
            ;;
        sqs)
            echo "Listing SQS Queues (region-independent)"
            aws sqs list-queues
            ;;
        dynamodb)
            echo "Listing DynamoDB Tables in $aws_region"
            aws dynamodb list-tables --region "$aws_region"
            ;;
        ebs)
            echo "Listing EBS Volumes in $aws_region"
            aws ec2 describe-volumes --region "$aws_region"
            ;;
        elasticbeanstalk)
            echo "Listing Elastic Beanstalk Applications in $aws_region"
            aws elasticbeanstalk describe-applications --region "$aws_region"
            ;;
        elasticache)
            echo "Listing ElastiCache Clusters in $aws_region"
            aws elasticache describe-cache-clusters --region "$aws_region"
            ;;
        eks)
            echo "Listing EKS Clusters in $aws_region"
            aws eks list-clusters --region "$aws_region"
            ;;
        ssm)
            echo "Listing SSM Managed Instances in $aws_region"
            aws ssm describe-instance-information --region "$aws_region"
            ;;
        secretsmanager)
            echo "Listing Secrets in AWS Secrets Manager in $aws_region"
            aws secretsmanager list-secrets --region "$aws_region"
            ;;
        *)
            echo "Invalid service. Please enter a valid service from the supported list."
            exit 1
            ;;
    esac
}

# Call the function
list_resources "$aws_service"
