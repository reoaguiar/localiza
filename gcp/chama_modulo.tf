##### Iniciando o provider
provider "google" {
  credentials = "C:/acesso.json"
  project     = "fourth-epigram-327201"
  region      = "us-central1"
}

##### Salvando TF-STATE
terraform {
  backend "gcs" {
    bucket  = "tfstate-localiza"
    prefix  = "terraform/state"
  }
}

module "vpc-terraform"{
    source                     = "./gcp-network"
    vpc-name                   = "vpc-terraform"
    auto_create_subnetworks    = false
    subnet-name                = "us-net"
    ip-sub-rede                = "192.168.20.0/24"
    region                     = "us-central1"
    fw-name                    = "fw-us"
    fw-protocol                = "tcp"
    fw-ports                   = ["22", "80", "6443", "2379", "2380", "10250", "10255", "10251", "10252", "30000-32767", "6783-6784"]
    fw-source                  = ["0.0.0.0/0"]
    fw-tags                    = ["ssh", "web", "k8s"]
}

module "instance_template"{
    source                     = "./gcp-instance-template"
    template-name              = "k8s-template"
    template-tags              = ["ubuntu", "k8s"]
    machine-type               = "f1-micro"
    ip-forward                 = false
    disk-image                 = "ubuntu-1804-lts"
    disk-auto-delete           = true
    disk-boot                  = true
    automatic-restart          = true
    host-maintenance           = "MIGRATE"
    network                    = module.vpc-terraform.net_name
    subnetwork                 = module.vpc-terraform.subnet_name
    gcp_ssh_pub_key            = "root:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxIgKCGTRIHPiJ+x5LjlLkKz+xYVTeSnjzm+sMqmB+ZQ9I7/P3lfrRIiOSYFrrKFud1KKNzkdCd10wVcrmMEnfgNgY0jVw15JRuatSK54NL08r17tzRxdfyAtLCsr1bHtKWj2ZtMatnQWFpqASM8ZmldsHU2mlfz12LUpZCMvvNC/6P1eQauYMSdAU7V9HINvV+vXdFGkiVOyhOYZeoU+UqzSKC8Y7/k3v7bZZSq/+Gs0XJzsQa7UJqPCY83uG92RUo/EMhZn1znKU4nWGpGZSCGmiqAo5AlR/J/BmEiM8vNtlIIgNqrZ6tGrAoTHLvt4vOt4fFDa24CFtVNlg0npB root@note-frank"
    startup-script             = "apt-get update && apt-get install -y nginx"
}

module "instance_group_web"{
    source                     = "./gcp-instance-group"
    instance-group-name        = "group-web"
    base-instance-name         = "web"
    region                     = "us-central1"
    zones                      = ["us-central1-a", "us-central1-b", "us-central1-c"]
    instance-template          = module.instance_template.instance_template_self_link
    autoscaler-name            = "auto-escaler"
    max-replicas               = 10
    min-replicas               = 3
    cooldown-period            = 60
    cpu-utilization            = 0.6
}

module "load-balancer"{
  source                             = "./gcp-load-balancer"
  forwarding-rule-name               = "forwarding-rule"
  forwarding-port-range              = "80"
  target-http-proxy-name             = "target-proxy"
  url-map-name                       = "url-map"
  http-health-check-name             = "check"
  http-health-check-path             = "/"
  backend-service-name               = "backend"
  backend-service-port               = "http"
  backend-service-protocol           = "HTTP"
  backend-service-timeout            = 10
  region_instance_group_manager      = module.instance_group_web.instance_group_url_group 
}
