# Configure the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # Replace with your desired region
}

# Create an S3 Bucket
resource "aws_s3_bucket" "website_bucket" {
  bucket = "demobucket391" # Replace with your desired bucket name

  acl = "public-read"

  website {
    index_document = "index.html"
  }
}

# Create an IAM Role for EC2 Instance
resource "aws_iam_role" "ec2_role" {
  name = "EC2InstanceRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

# Attach IAM Policy to the Role (e.g., for S3 access)
resource "aws_iam_role_policy_attachment" "s3_access_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

# Create an EC2 Security Group
resource "aws_security_group" "allow_http" {
  name       = "allow_http"
  description = "Allow HTTP traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch an EC2 Instance
resource "aws_instance" "web_server" {
  ami           = "ami-01816d07b1128cd2d" # Replace with the desired AMI ID
  instance_type = "t2.micro"

  security_groups = [aws_security_group.allow_http.id]

  tags = {
    Name = "WebServer"
  }
}

# Upload website content to S3 (you can use the AWS CLI or other tools)
# Example using AWS CLI:
# aws s3 cp ./website_content/ s3://my-website-bucket/ --recursive

# Output the public IP address of the EC2 instance
output "public_ip" {
  value = aws_instance.web_server.public_ip
}
