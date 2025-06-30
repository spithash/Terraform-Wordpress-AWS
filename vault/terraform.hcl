# Let Terraform create, update, read, and delete the SSH keys stored here
path "wordpress_deployment/data/terraform/ssh/*" {
  capabilities = ["create", "update", "read", "delete"]
}

# Allow Terraform to check info about the stored keys — like versions and metadata
path "wordpress_deployment/metadata/terraform/ssh/*" {
  capabilities = ["read", "list"]
}

# Let Terraform create new tokens when it needs them during its workflow
path "auth/token/create" {
  capabilities = ["update"]
}

