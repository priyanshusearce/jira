// file: backend.tf
terraform {
  backend "gcs" {
    bucket = "apigate-searce-tf-bucket"
    prefix = "stg/project-apigate-stg-hub/global/demo-bucket"
  }
}
