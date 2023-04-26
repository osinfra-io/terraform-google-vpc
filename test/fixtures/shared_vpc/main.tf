module "test" {
  source = "../../../global"

  network_name = "shared-test-vpc"
  project      = var.project
  shared_vpc   = true
}
