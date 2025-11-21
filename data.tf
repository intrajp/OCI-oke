# data.tf

# 1. Get Compartment ID from reading compartments module
data "terraform_remote_state" "compartments" {
  backend = "oci"
  config = {
    bucket    = "bucket-20251111-1910"
    namespace = "nrdrpcgfpznz"
    key       = "compartments/terraform.tfstate"
    region    = "ap-osaka-1"
  }
}

# 2. Get VCN and OKE Subnet ID from network module
data "terraform_remote_state" "network" {
  backend = "oci"
  config = {
    bucket    = "bucket-20251111-1910"
    namespace = "nrdrpcgfpznz"
    key       = "network/terraform.tfstate"
    region    = "ap-osaka-1"
  }
}
