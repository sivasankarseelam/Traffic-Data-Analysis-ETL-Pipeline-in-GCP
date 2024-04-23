import pandas as pd
from google.cloud import storage

# Initialize the GCP storage client
storage_client = storage.Client()

# Specify the bucket name where you want to upload the datasets
# Replace 'your-bucket-name' with your actual bucket name
bucket_name = 'cycling_raw_data'

# Specify the local file paths for the datasets
local_file_1 = '1_Monitoring_locations.csv'
local_file_2 = '2014_Jan_March.csv'

# Function to upload a file to the specified bucket
def upload_to_bucket(bucket_name, local_file):
    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(local_file)
    blob.upload_from_filename(local_file)
    print(f'{local_file} uploaded to {bucket_name}')

# Upload the first dataset to the bucket
upload_to_bucket(bucket_name, local_file_1)

# Upload the second dataset to the same bucket
upload_to_bucket(bucket_name, local_file_2)


