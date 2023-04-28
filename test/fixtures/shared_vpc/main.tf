module "global" {
  source = "../../../global"

  name       = "shared-test-vpc"
  project    = var.project
  shared_vpc = true
}
