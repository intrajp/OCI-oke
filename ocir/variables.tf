variable "tenancy_ocid" {
  description = "OCID of the OCI tenancy"
  type        = string
  sensitive   = true
}

variable "user_ocid" {
  description = "OCID of the OCI user used by Terraform"
  type        = string
  sensitive   = true
}

variable "fingerprint" {
  description = "Fingerprint of the OCI API signing key"
  type        = string
  sensitive   = true
}

variable "private_key_path" {
  description = "Local path to the OCI API signing private key"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "OCI region in which to create the container repository"
  type        = string
}

variable "oke_compartment_id" {
  description = "OCID of the compartment used for OKE-related resources"
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "Domain name served by the application"
  type        = string
}
