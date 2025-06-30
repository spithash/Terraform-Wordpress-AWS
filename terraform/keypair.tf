provider "tls" {}

provider "vault" {
  address = var.vault_addr
  token   = var.vault_token
}

# Step 1: Generate SSH Key
resource "tls_private_key" "my_key" {
  algorithm = "ED25519"
}

# Step 2: Create AWS Key Pair
resource "aws_key_pair" "deployer" {
  key_name   = "wordpress-key-${random_id.suffix.hex}"
  public_key = tls_private_key.my_key.public_key_openssh
}

# Random suffix to avoid name collisions
resource "random_id" "suffix" {
  byte_length = 4
}

# Step 3: Store private key in Vault
resource "vault_kv_secret_v2" "ssh_key" {
  mount = "wordpress_deployment"
  name  = "terraform/ssh/my_key"
  data_json = jsonencode({
    private_key = tls_private_key.my_key.private_key_pem
  })
}

