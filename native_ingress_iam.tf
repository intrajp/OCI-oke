locals {
  native_ingress_network_compartment_id = data.terraform_remote_state.compartments.outputs.infra_compartment_id

  native_ingress_oke_permissions = [
    "manage load-balancers",
    "manage cabundles",
    "manage cabundle-associations",
    "manage leaf-certificates",
    "read leaf-certificate-bundles",
    "manage leaf-certificate-versions",
    "manage certificate-associations",
    "read certificate-authorities",
    "manage certificate-authority-associations",
    "read certificate-authority-bundles",
    "read public-ips",
    "manage floating-ips",
    "manage waf-family",
    "read cluster-family",
  ]
}

# The standalone OCI Native Ingress Controller runs on a managed worker node.
# This dynamic group lets the controller use that node's instance principal.
resource "oci_identity_dynamic_group" "oke_native_ingress_controller" {
  compartment_id = var.tenancy_ocid
  name           = "oke-native-ingress-controller"
  description    = "OKE worker nodes used by the OCI Native Ingress Controller"
  matching_rule  = "ALL {instance.compartment.id = '${local.compartment_id}'}"
}

resource "oci_identity_policy" "oke_native_ingress_controller" {
  compartment_id = var.tenancy_ocid
  name           = "oke-native-ingress-controller-policy"
  description    = "Permissions required by the standalone OCI Native Ingress Controller"

  statements = concat(
    [
      for permission in local.native_ingress_oke_permissions :
      "Allow dynamic-group id ${oci_identity_dynamic_group.oke_native_ingress_controller.id} to ${permission} in compartment id ${local.compartment_id}"
    ],
    [
      "Allow dynamic-group id ${oci_identity_dynamic_group.oke_native_ingress_controller.id} to use virtual-network-family in compartment id ${local.native_ingress_network_compartment_id}"
    ]
  )
}
