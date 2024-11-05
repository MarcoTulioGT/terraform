provider "google" {
  credentials = file("/home/maco/Documentos/Dataengineer/terraform/service-account-file.json")
  project     = "node-aplication-397016"
  region      = "us-central1"
}

resource "google_storage_bucket" "my_bucket" {
  name          = "datalakex"
  location      = "us-central1"
  force_destroy = true
  uniform_bucket_level_access = true

  labels = {
    environment = "production"
    team        = "dataengineer"
  }
}

resource "google_storage_bucket_object" "raw_data" {
  name   = "raw_data/" 
  bucket = google_storage_bucket.my_bucket.name
  content = "empty.txt"
}

resource "google_storage_bucket_object" "stage_data" {
  name   = "stage_data/" 
  bucket = google_storage_bucket.my_bucket.name
  content = "empty.txt"
}

resource "google_storage_bucket_object" "processed_data" {
  name   = "processed_data/" 
  bucket = google_storage_bucket.my_bucket.name
  content = "empty.txt"
}

resource "google_storage_bucket_iam_member" "no_public_access" {
  bucket = google_storage_bucket.my_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allAuthenticatedUsers"
}