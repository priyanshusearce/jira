# Specify the GCP Provider
provider "google" {
project = "project-apigate-stg-hub"
region  = "asia-south1"
}

# Create a GCS Bucket
resource "google_storage_bucket" "default" {
name     = "apigate-testing-bucket2"
location = "asia-south1"
}
