variable "template-name"{
    type        = string
    default     = "ubuntu-us-central"
}

variable "template-tags"{
    type        = list
    default     = ["ubuntu", "k8s"]
}

variable "machine-type"{
    type        = string
    default     = "f1-micro"
}

variable "ip-forward"{
    type        = bool
    default     = false
}

variable "disk-image"{
    type        = string
    default     = "ubuntu-1804-lts"
}

variable "disk-auto-delete"{
    type        = bool
    default     = true
}

variable "disk-boot"{
    type        = bool
    default     = true
}

variable "automatic-restart"{
    type        = bool
    default     = true
}

variable "host-maintenance"{
    type        = string
    default     = "MIGRATE"
}

variable "network"{
    type        = string
    default     = "default"
}

variable "subnetwork"{
    type        = string
    default     = "default"
}

variable "gcp_ssh_pub_key" {
  type = string
  default = "root:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxIgKCGTRIHPiJ+x5LjlLkKz+xYVTeSnjzm+sMqmB+ZQ9I7/P3lfrRIiOSYFrrKFud1KKNzkdCd10wVcrmMEnfgNgY0jVw15JRuatSK54NL08r17tzRxdfyAtLCsr1bHtKWj2ZtMatnQWFpqASM8ZmldsHU2mlfz12LUpZCMvvNC/6P1eQauYMSdAU7V9HINvV+vXdFGkiVOyhOYZeoU+UqzSKC8Y7/k3v7bZZSq/+Gs0XJzsQa7UJqPCY83uG92RUo/EMhZn1znKU4nWGpGZSCGmiqAo5AlR/J/BmEiM8vNtlIIgNqrZ6tGrAoTHLvt4vOt4fFDa24CFtVNlg0npB root@note-frank"
}

variable "startup-script" {
  type = string
  default = "apt-get update && apt-get install -y nginx"
}