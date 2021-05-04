terraform {
  backend "gcs" {
    prefix  = "terraform/state"
    bucket  = pub-sub-example-tf-state-f529cd5e2b7b
  }
}
