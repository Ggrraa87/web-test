terraform {
  required_providers {
    twc = {
      source = "timeweb-cloud/timeweb-cloud"
    }
  }
  # Keep state outside the cluster (e.g. Timeweb S3) so destroy/apply is repeatable.
  # backend "s3" {}
}

provider "twc" {
  # Token from the TWC_TOKEN environment variable.
}

data "twc_k8s_preset" "master" {
  type     = "master"
  cpu      = var.master_cpu
  location = var.location
}

data "twc_k8s_preset" "worker" {
  type     = "worker"
  cpu      = var.worker_cpu
  location = var.location
}

resource "twc_k8s_cluster" "this" {
  name              = var.cluster_name
  version           = var.k8s_version
  network_driver    = var.network_driver
  high_availability = false
  ingress           = var.ingress
  preset_id         = data.twc_k8s_preset.master.id

  maintenance_slot {
    type = "fixed_time"
    from = "02:00"
    to   = "06:00"
  }
}

resource "twc_k8s_node_group" "workers" {
  cluster_id     = twc_k8s_cluster.this.id
  name           = "workers"
  preset_id      = data.twc_k8s_preset.worker.id
  node_count     = var.worker_count
  is_autohealing = true

  is_autoscaling = var.autoscaling
  min_size       = var.autoscaling ? var.worker_min : null
  max_size       = var.autoscaling ? var.worker_max : null
}

output "kubeconfig" {
  value     = twc_k8s_cluster.this.kubeconfig
  sensitive = true
}
