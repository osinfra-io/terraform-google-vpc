run "test" {
  command = apply

  assert {
    condition     = module.test.name == "test-vpc"
    error_message = "Fail early, fail often, but always fail forward!"
  }

  assert {
    condition     = module.test.project == "test-default-tf75-sb"
    error_message = "Fail early, fail often, but always fail forward!"
  }

  assert {
    condition     = module.test.self_link == "https://www.googleapis.com/compute/v1/projects/test-default-tf75-sb/global/networks/test-vpc"
    error_message = "Fail early, fail often, but always fail forward!"
  }
}
