module "global" {
  source = "../../../global"

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
}

module "regional" {
  source = "../../../regional"

  project_id = var.project

  # Secondary ranges are used to allocate IP addresses to resources in a subnetwork. In this example we create Pod IP address ranges
  # and Service (ClusterIP) address ranges for a VPC-native cluster.

  # https://cloud.google.com/kubernetes-engine/docs/concepts/alias-ips

  secondary_ranges = {
    "default-subnet-us-east1" = [
      {
        range_name    = "default-services-us-east1"
        ip_cidr_range = "10.60.240.0/20"
      },
      {
        range_name    = "default-pods-us-east1"
        ip_cidr_range = "10.0.0.0/14"
      }
    ]
  }

  subnets = {
    default-subnet-us-east1 = {

      # When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and
      # services by using Private Google Access. This is required for private Kubernetes clusters.

      private_ip_google_access = true
      network                  = module.global.name
      range                    = "10.60.0.0/20"
      region                   = "us-east1"
    },

    # Google Cloud Internal HTTP(S) Load Balancing is a proxy-based, regional Layer 7 load balancer that enables you to run and
    # scale your services behind an internal IP address. In this example we create a proxy-only subnet.

    # https://cloud.google.com/load-balancing/docs/proxy-only-subnets#proxy_only_subnet_create

    default-internal-lb-subnet-us-east1 = {
      network = module.global.name
      range   = "10.61.240.0/20"
      region  = "us-east1"
      purpose = "INTERNAL_HTTPS_LOAD_BALANCER"
      role    = "ACTIVE"
    }
  }
}
