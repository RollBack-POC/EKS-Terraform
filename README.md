# EKS-Terraform
Provisioning the Elastic Kubernetes Service ( EKS ) using Terraform.

**To Provision the cluster Run the below commands**.

- terraform init
- terraform fmt
- terraform validate

**Note:-** Before running the **terraform plan** and **terraform apply**, Update the **eks.tfvars** file with proper value.

- terraform plan -var-file=eks.tfvars
- terraform apply -var-file=eks.tfvars -auto-approve

**To Destroy the cluster Run the below commands**
- terraform destroy -var-file=eks.tfvars -auto-approve
