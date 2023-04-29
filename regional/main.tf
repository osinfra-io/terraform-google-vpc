# Compute Subnetwork Resource
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

resource "google_compute_subnetwork" "this" {
  for_each = var.subnets

  ip_cidr_range            = each.value.range
  name                     = each.key
  network                  = each.value.network
  private_ip_google_access = each.value.private_ip_google_access
  project                  = var.project
  purpose                  = each.value.purpose
  region                   = each.value.region
  role                     = each.value.role

  secondary_ip_range = [
    for i in range(
      length(
        contains(
        keys(var.secondary_ranges), each.key) == true
        ? var.secondary_ranges[each.key]
        : []
    )) :
    var.secondary_ranges[each.key][i]
  ]

  dynamic "log_config" {
    for_each = each.value.purpose != "INTERNAL_HTTPS_LOAD_BALANCER" ? [0] : []
    content {
      flow_sampling        = 0.5
      metadata             = "INCLUDE_ALL_METADATA"
      aggregation_interval = "INTERVAL_5_SEC"
    }
  }
}
