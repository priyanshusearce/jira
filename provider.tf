# Specify the provider (GCP, AWS, Azure)
provider "google" {
credentials = "${file("credentials.json")}"
project = "searce-playground"
zone = "asia-south1"
}