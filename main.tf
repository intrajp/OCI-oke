# Save local variables OCID which had been taken from OCI-infra
locals {
  compartment_id = data.terraform_remote_state.compartments.outputs.oke_compartment_id
  vcn_id             = data.terraform_remote_state.network.outputs.vcn_id
  oke_subnet_id      = data.terraform_remote_state.network.outputs.oke_private_subnet_id
}

# -------------------------------------------------
# OKE cluster (control plane)
# -------------------------------------------------
resource "oci_containerengine_cluster" "my_cluster" {
  compartment_id   = local.compartment_id
  name             = "MyOkeCluster"
  vcn_id           = local.vcn_id
  kubernetes_version = "v1.33.1"
}

# -------------------------------------------------
# OKE worker node pool
# -------------------------------------------------
resource "oci_containerengine_node_pool" "my_node_pool" {
  cluster_id     = oci_containerengine_cluster.my_cluster.id
  compartment_id = local.compartment_id
  name           = "MyNodePool"

  node_shape = "VM.Standard.E4.Flex"

  node_config_details {
    size = 2

    placement_configs {
      availability_domain = "uSnm:AP-OSAKA-1-AD-1"
      subnet_id = local.oke_subnet_id
    }
  }

  node_shape_config {
    ocpus         = 1
    memory_in_gbs = 16
  }

  node_source_details {
    source_type = "image"
    ### FIX ME (This should go to ENVIRONMENT in OCI-infra
    image_id    = "ocid1.image.oc1.ap-osaka-1.aaaaaaaarqza4sz7otprlpkwovhcag5aus6yfozvx37bzgzls6zugtnqdqnq" # Oracle-Linux-8.10-2025.09.16-0-OKE-1.33.1-1330 
  }

  initial_node_labels {
    key   = "name"
    value = "worker"
  }
}
