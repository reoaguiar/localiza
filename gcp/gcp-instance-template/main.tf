resource "google_compute_instance_template" "instance-template" {
  name                  = var.template-name
  tags                  = var.template-tags
  machine_type          = var.machine-type
  can_ip_forward        = var.ip-forward

  disk{
    source_image        = var.disk-image
    auto_delete         = var.disk-auto-delete
    boot                = var.disk-boot
  }
  
  scheduling {
    automatic_restart   = var.automatic-restart
    on_host_maintenance = var.host-maintenance
  }

  network_interface {
    network             = var.network
    subnetwork          = var.subnetwork

    access_config {
        //Ephemeral IP
    }
  }
  metadata = {
    ssh-keys = var.gcp_ssh_pub_key
  }
  metadata_startup_script = var.startup-script
}