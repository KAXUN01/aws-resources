Script to automate the process of listing all the resources in an AWS account

 # Below are the services that are supported by this script:
 1. EC2
 2. RDS
 3. S3
 4. CloudFront
 5. VPC
 6. IAM
 7. Route53
 8. CloudWatch
 9. CloudFormation
 10. Lambda
 11. SNS
 12. SQS
 13. DynamoDB
 14. EBS
 15. Elastic Beanstalk
 16. ElastiCache
 17. EKS
 18. SSM
 19. Secrets Manager

 The script will prompt the user to enter the AWS region and the service for which the resources need to be listed.

 Usage: ./aws_resource_list.sh <aws_region> <aws_service>
 Example: ./aws_resource_list.sh us-east-1 ec2
