# Equip9-Assignment

1) HTTP Service:

 To achieve the required functionality of listing the contents of a specific path in the S3 bucket and returning the response in JSON format,
 here i used Python script for which is added inside this Repo "HTTP service".

 According to the given usecase if the Path is not specified then the "Top level content of the bucket is displayed as it is in the JSON format
 By using the Python boto3 script here if we dont specify the path the following output is displayed.

 Response:
 {
    "content": [
        "dir1",
        "dir2"
    ]
}

Similarly, for given path of bucket object Dir1 s3://demobucket390/dir1/
Response:

{
    "content": []
}


And, for the specified path of Object Dir2 s3://demobucket390/dir2/

Response:

 {
    "content": [
        "file1.txt",
        "file2.txt"
    ]
}


___________________________________________________________________________________________________________________________________________________________________________________________________



2) Terraform Deployment:

Here the Terraform is used define and provision the infrastructure for a basic web server on AWS and display the contents of S3 Buckets through the Htto enpoint on wepbage.

 Some of the Functinalities of it are as follows:

i) Provisions an S3 Bucket:

Creates an S3 bucket to store the website's static content (HTML, CSS, JavaScript, images, etc.).
Configures the bucket for website hosting by defining index.html as the default document and error.html for error pages.
Sets the bucket's access control list (acl) to "public-read" to allow public access to the website content.
Creates an EC2 Instance:

ii) Launches an EC2 instance (a virtual server) in the specified AWS region.
Configures the instance with a chosen Amazon Machine Image (AMI) and instance type.
Assigns an IAM role to the instance, granting it necessary permissions (in this case, read-only access to the S3 bucket).
Associates a security group with the instance, allowing incoming HTTP traffic on port 80 while restricting other traffic.

iii) Outputs the Public IP:

Provides the public IP address of the launched EC2 instance, making it accessible from the internet.

Terraform here enables declarative configuration, allowing you to describe the desired state of your infrastructure, and Terraform manages the creation and updates.

