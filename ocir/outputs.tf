output "repository_id" {
  description = "OCID of the OCIR repository"
  value       = oci_artifacts_container_repository.letsgopc_web.id
}

output "repository_name" {
  description = "Name of the OCIR repository"
  value       = oci_artifacts_container_repository.letsgopc_web.display_name
}

output "repository_path" {
  description = "Fully qualified OCIR repository path"
  value       = "ocir.${var.region}.oci.oraclecloud.com/${oci_artifacts_container_repository.letsgopc_web.namespace}/${oci_artifacts_container_repository.letsgopc_web.display_name}"
}
