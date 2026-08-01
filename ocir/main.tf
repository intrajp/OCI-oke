resource "oci_artifacts_container_repository" "letsgopc_web" {
  compartment_id = var.oke_compartment_id
  display_name   = "letsgopc-web"
  is_public      = false
  is_immutable   = false

  freeform_tags = {
    Application = "letsgopc-web"
    Domain      = var.domain_name
    ManagedBy   = "Terraform"
  }
}
