# --- SSH key permissions ---

# Allow Terraform to manage SSH keys
path "wordpress_deployment/data/terraform/ssh/*" {
  capabilities = ["create", "update", "read", "delete"]
}

# Allow Terraform to read and list metadata for SSH keys
path "wordpress_deployment/metadata/terraform/ssh/*" {
  capabilities = ["read", "list"]
}

# --- MySQL credentials permissions (for Ansible via Terraform token) ---

# Allow Terraform (and Ansible using this token) to manage MySQL credentials
path "wordpress_deployment/data/mysql/*" {
  capabilities = ["create", "update", "read", "delete"]
}

# Allow reading/listing MySQL credential metadata
path "wordpress_deployment/metadata/mysql/*" {
  capabilities = ["read", "list"]
}

# Allow Terraform (and Ansible using this token) to manage WordPress credentials
path "wordpress_deployment/data/wordpress/*" {
  capabilities = ["create", "update", "read", "delete"]
}

# Allow reading/listing WordPress credential metadata
path "wordpress_deployment/metadata/wordpress/*" {
  capabilities = ["read", "list"]
}

# --- Token creation (needed by Terraform during provisioning) ---

path "auth/token/create" {
  capabilities = ["update"]
}

