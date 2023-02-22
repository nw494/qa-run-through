resource "google_compute_instance" "nikjenks" {
  name         = "nik-vm"
  machine_type = var.instance-type
  zone         = "us-west2-a"
  tags = ["nw-allow-http", "nik-allow-extssh", "nw-allow-intssh-source"]

  boot_disk {
    initialize_params {
      image = var.image-id
    }
  }

  metadata_startup_script = "sudo apt-get update && sudo apt-get install -y docker.io"

  network_interface {
    subnetwork = google_compute_subnetwork.nikpublic.id

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}