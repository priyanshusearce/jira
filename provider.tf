# Specify the provider (GCP, AWS, Azure)
provider "google" {
    credentials = "${file("./creds/credentials.json")}"
    project = "searce-playground"
    zone = "asia-south1"
}