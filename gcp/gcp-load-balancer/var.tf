##### Forwading rule

variable "forwarding-rule-name"{
    type              = string
    default           = "global-rule"
}

variable "forwarding-port-range"{
    type              = string
    default           = "80"
}

####### compute_target_http_proxy

variable "target-http-proxy-name"{
    type              = string
    default           = "target-proxy"
}

######### compute_url_map

variable "url-map-name"{
    type              = string
    default           = "url-map-target-proxy"
}
################# Health check

variable "http-health-check-name"{
    type              = string
    default           = "check"
}
variable "http-health-check-path"{
    type              = string
    default           = "/"
}

################# backend

variable "backend-service-name"{
    type              = string
    default           = "backend"
}
variable "backend-service-port"{
    type              = string
    default           = "http"
}

variable "backend-service-protocol"{
    type              = string
    default           = "HTTP"
}

variable "backend-service-timeout"{
    type              = number
    default           = 10
}

variable "region_instance_group_manager"{
   type               = string
   default            = "group1"
}