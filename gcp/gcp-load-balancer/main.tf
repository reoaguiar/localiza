resource "google_compute_global_forwarding_rule" "forwarding-rule" {
  name               = var.forwarding-rule-name
  target             = google_compute_target_http_proxy.target_http_proxy.self_link
  port_range         = var.forwarding-port-range
}

resource "google_compute_target_http_proxy" "target_http_proxy" {
  name               = var.target-http-proxy-name
  url_map            = google_compute_url_map.url-map.self_link
}

resource "google_compute_url_map" "url-map" {
  name               = var.url-map-name
  default_service    = google_compute_backend_service.default.self_link
}

resource "google_compute_http_health_check" "check" {
  name               = var.http-health-check-name
  request_path       = var.http-health-check-path
}

resource "google_compute_backend_service" "default" {
  name               = var.backend-service-name
  port_name          = var.backend-service-port
  protocol           = var.backend-service-protocol
  timeout_sec        = var.backend-service-timeout
  health_checks      = [google_compute_http_health_check.check.self_link]
  backend {
    group            = var.region_instance_group_manager
  }
  
}