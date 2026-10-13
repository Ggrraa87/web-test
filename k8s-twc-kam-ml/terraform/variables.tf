variable "cluster_name" {
  type    = string
  default = "twc-kam-ml"
}

variable "location" {
  type    = string
  default = "ru-1"
}

# Set to the version the current cluster runs (kubectl version).
variable "k8s_version" {
  type = string
}

# Must match the current cluster's CNI (flannel/calico/cilium, as offered by the API).
variable "network_driver" {
  type    = string
  default = "flannel"
}

variable "ingress" {
  type    = bool
  default = true
}

variable "master_cpu" {
  type    = number
  default = 4
}

variable "worker_cpu" {
  type    = number
  default = 4
}

variable "worker_count" {
  type    = number
  default = 1
}

variable "autoscaling" {
  type    = bool
  default = false
}

variable "worker_min" {
  type    = number
  default = 1
}

variable "worker_max" {
  type    = number
  default = 3
}
