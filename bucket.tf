# Specify the GCP Provider
provider "google" {
project = "project-apigate-stg-hub"
region  = "asia-south1-a"
}

# Create a GCS Bucket
resource "google_storage_bucket" "my_bucket" {
name     = "testing-bucket"
location = "asia-south1-a"
}