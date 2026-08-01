terraform {
  backend "oci" {
    bucket    = "bucket-20251111-1910"
    namespace = "nrdrpcgfpznz"
    key       = "oke/terraform.tfstate" # for oke only
    region    = "ap-osaka-1"
  }
}
