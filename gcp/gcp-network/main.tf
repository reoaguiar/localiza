##### Criação da VPC
resource "google_compute_network" "vpc" {
  name = var.vpc-name

  auto_create_subnetworks = var.auto_create_subnetworks
}
resource "google_compute_subnetwork" "vpc-subnet" {
  name          = var.subnet-name
  ip_cidr_range = var.ip-sub-rede
  region        = var.region
  network       = google_compute_network.vpc.id
}
##### regras de firewalll

resource "google_compute_firewall" "fw" {
  name    = var.fw-name
  network = google_compute_network.vpc.name

  allow {
    protocol = var.icmp
  }

  allow {
    protocol = var.fw-protocol
    ports    = var.fw-ports
  }
  source_ranges = var.fw-source
  source_tags = var.fw-tags
}
