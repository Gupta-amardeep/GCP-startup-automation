provider "google" {
  project = "qwiklabs-gcp-00-6cf1330412b9"
  region = "us-central1"
}

resource "google_compute_address" "my-ip" {
  name = "my-ip-address"
}

resource "google_compute_instance" "vm_instance" {
  name = var.vm-name
  machine_type = var.machine
  zone = var.zone
  tags = [var.tags]

  metadata_startup_script = "${file("./scripts/startup.sh")}"

  boot_disk {
      initialize_params {
          image = var.image
          type = var.image_type
          size = var.image_size
      }
  }

  network_interface {
      network = var.network
      access_config {
          nat_ip = google_compute_address.my-ip.address
      }
  }
}

resource "google_compute_firewall" "my-firewall" {
  name = "my-firewall"
  network = var.network
  target_tags = [var.tags]

  allow {
    protocol = var.protocol
    ports    = [var.port[0]]
  }
}