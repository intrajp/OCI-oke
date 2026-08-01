# OCIR repository

This Terraform configuration creates the private `letsgopc-web` container
repository in Oracle Cloud Infrastructure Registry (OCIR).

The OCI provider variables are supplied through `TF_VAR_*` environment
variables. Load the local environment file before running Terraform:

```bash
source ~/terraform/env.sh
cd ~/terraform/OCI-oke/ocir
terraform init -backend-config=my-config.tfbackend
terraform plan
terraform apply
```

`my-config.tfbackend`, Terraform state, variable files, private keys, and the
`.terraform` directory are excluded by the repository's root `.gitignore`.
