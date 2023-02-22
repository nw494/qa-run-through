resource "google_compute_network" "niklbg_network" {
  name = "nik-terraform-network"
}

resource "google_compute_subnetwork" "nikpublic" {
  name          = "niklbg-public-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-west2"
  network       = google_compute_network.niklbg_network.id
}

