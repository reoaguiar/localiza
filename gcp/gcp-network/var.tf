########### VPC
variable "vpc-name" {
    type     = string
    default  = "vpc"
}

variable "auto_create_subnetworks"{
    type    = bool
    default = false
}

########### Sub-rede
variable "subnet-name" {
    type     = string
    default  = "sub-net"
}
variable "ip-sub-rede" {
    type     = string
    default  = "192.168.10.0/24"
}

variable "region" {
    type     = string
    default  = "us-central1"
}

############ Firewall

variable "fw-name" {
    type     = string
    default  = "fw-k8s"
}

variable "icmp" {
    type     = string
    default  = "icmp"
}

variable "fw-protocol" {
    type     = string
    default  = "tcp"
}

variable "fw-ports" {
    type     = list
    default  = ["22"]
}

variable "fw-source" {
    type     = list
    default  = ["0.0.0.0/0"]
}

variable "fw-tags" {
    type     = list
    default  = ["ssh"]
}