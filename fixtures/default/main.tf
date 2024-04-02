module "test" {
  source = "../../global"

  name    = "test-vpc"
  project = var.project

  # The following rules test each of the dynamic blocks in various combinations. This should
  # provide decent examples of how create different types of firewall rules.

  rules = [
    {
      allow = [
        {
          ports    = ["22", "443"]
          protocol = "tcp"
        },
        {
          ports    = ["53"]
          protocol = "udp"
        }
      ]

      direction = "INGRESS"

      name = "test-01"

      ranges = [
        "130.211.0.0/22",
        "35.191.0.0/16"
      ]
    },

    {
      deny = [
        {
          ports    = ["80"]
          protocol = "tcp"
        }
      ]

      direction          = "EGRESS"
      log_config_enabled = false
      name               = "test-02"
      ranges             = ["35.235.240.0/20"]
    },

    {
      allow = [
        {
          ports    = ["5432"]
          protocol = "tcp"
        }
      ]

      direction           = "INGRESS"
      log_config_metadata = "EXCLUDE_ALL_METADATA"
      name                = "test-03"
      ranges              = ["10.0.0.8/32"]
    }
  ]

  # In order to test this we would need a new project created in the google-cloud-kitchen-terraform
  # repository. The existing projects are already a shared VPC host or service projects.

  shared_vpc = false
}
