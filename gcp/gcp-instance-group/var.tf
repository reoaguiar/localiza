variable "instance-group-name"{
    type       = string
    default    = "instance-group"
}
variable "base-instance-name"{
    type       = string
    default    = "group"
}
variable "region"{
    type       = string
    default    = "us-central1"
}
variable "zones"{
    type       = list
    default    = ["us-central1-a","us-central1-b", "us-central1-c"]
}
variable "instance-template"{
    type       = string
    default    = "template-default"
}
############### Auto Escaler

variable "autoscaler-name"{
    type       = string
    default    = "auto-escaler"
}
variable "max-replicas"{
    type       = number
    default    = 3
}
variable "min-replicas"{
    type       = number
    default    = 1
}
variable "cooldown-period"{
    type       = number
    default    = 60
}
variable "cpu-utilization"{
    type       = number
    default    = 0.6
}