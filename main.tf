provider "google" {
  credentials = file("/home/maco/Documentos/Dataengineer/terraform/service-account-file.json")
  project     = "node-aplication-397016"
  region      = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "test-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}
