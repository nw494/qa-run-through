resource "google_compute_firewall" "nw_allow_http" {
  name        = "nik-fw-allow-http"
  network     = google_compute_network.niklbg_network.id
  
  allow {
    protocol  = "tcp"
    ports     = ["8080", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["nw-allow-http"]
}

resource "google_compute_firewall" "nw_allow_external_ssh" {
  name        = "nik-allow-extssh"
  network     = google_compute_network.niklbg_network.id
  
  allow {
    protocol  = "tcp"
    ports     = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["nw-allow-extssh"]
}

resource "google_compute_firewall" "nw_allow_internal_ssh" {
  name        = "nik-allow-intssh"
  network     = google_compute_network.niklbg_network.id
  
  allow {
    protocol  = "tcp"
    ports     = ["22"]
  }
  direction = "INGRESS"
  target_tags = ["nw-allow-intssh-target"]
  source_tags = ["nw-allow-intssh-source"]
}
