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

And, for the specified path of Object Dir2 

Response:

s3://demobucket390/dir2/
