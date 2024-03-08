# upload_to_s3.py
import boto3

def upload_file(file_name, bucket, object_name=None):
    s3_client = boto3.client('s3')
    if object_name is None:
        object_name = file_name
    s3_client.upload_file(file_name, bucket, object_name)
    print(f"Uploaded {file_name} to {bucket}/{object_name}")

if __name__ == '__main__':
    upload_file('output.txt', 'example-s3-bucket', 'output.txt')  # Replace 'example-s3-bucket'
