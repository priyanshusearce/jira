# # Specify the GCP Provider
# provider "google" {
# project = "project-apigate-stg-hub"
# region  = "asia-south1"
# }

# # Create a GCS Bucket
# resource "google_storage_bucket" "default" {
# name     = "apigate-testing-bucket"
# location = "asia-south1"
# }

# Specify the GCP Provider
# provider "google" {
# project = "searce-playground"
# region  = "asia-south1"
# }

provider "google" {
    credentials = "${file("./creds/credentials.json")}"
    project = "searce-playground"
    zone = "asia-south1"
}

# Create a GCS Bucket
resource "google_storage_bucket" "default" {
    name     = "apigate-testing-bucket"
    location = "asia-south1"
}
