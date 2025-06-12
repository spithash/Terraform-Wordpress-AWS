# Generate Ed25519 private key
resource "tls_private_key" "my_key" {
  algorithm = "ED25519"
}

# Create AWS key pair with the generated public key
resource "aws_key_pair" "deployer" {
  key_name   = "myrandomkeyname"
  public_key = tls_private_key.my_key.public_key_openssh
}

# Save private key locally for SSH access
resource "null_resource" "save_key_pair" {
  provisioner "local-exec" {
    command = "echo '${tls_private_key.my_key.private_key_openssh}' > mysecurekey.pem && chmod 600 mysecurekey.pem"
  }
}

