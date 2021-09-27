resource "google_compute_region_instance_group_manager" "us-group" {
  name                       = var.instance-group-name
  base_instance_name         = var.base-instance-name
  region                     = var.region
  distribution_policy_zones  = var.zones

  version {
    instance_template        = var.instance-template
  }
}
resource "google_compute_region_autoscaler" "autoscaler" {
  name                       = var.autoscaler-name
  region                     = var.region
  target                     = google_compute_region_instance_group_manager.us-group.id

  autoscaling_policy {
    max_replicas             = var.max-replicas
    min_replicas             = var.min-replicas
    cooldown_period          = var.cooldown-period

    cpu_utilization {
      target                 = var.cpu-utilization
    }
  }
}