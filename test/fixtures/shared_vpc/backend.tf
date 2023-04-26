terraform {
  backend "gcs" {
    bucket = "tf-child-modules-github-actions-state"
  }
}
