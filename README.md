# OCI OKE cluster with Terraform

This project deploys a Kubernetes cluster on Oracle Cloud Infrastructure (OCI) using Terraform.

## ⚙️ 1. Configuration

### 1. Backend Configuration

You must edit the `backend.tf` file to match your OCI environment.

```hcl
# Example: backend.tf
terraform {
  backend "oci" {
    bucket    = "bucket-20251111-1910" # ⬅️ Your bucket name
    namespace = "nrdrpcgfpznz"           # ⬅️ Your Object Storage namespace
    key       = "oke/terraform.tfstate"
    region    = "ap-osaka-1"
  }
}
```

### 2. Environment Variables

refer OCI-infra: https://github.com/intrajp/OCI-infra

## 🚀 3. Deployment Steps

Go to OCI-infra/network

```Bash
terraform init
terraform apply
```
Back to OCI-oke

```Bash
terraform init
terraform apply
```

## 🧹 5. Cleanup (Destroy)

On OCI-oke

```bash
terraform destroy
```
