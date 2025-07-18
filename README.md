# Terraform WordPress AWS Deployment

Automated WordPress deployment on AWS orchestrated through Terraform while trying to stick with the AWS free plan.  
Configuration management is done via [Ansible](https://github.com/spithash/Terraform-Wordpress-AWS/tree/main/ansible).

To securely manage sensitive data like SSH private keys, this setup integrates HashiCorp [Vault](https://github.com/spithash/Terraform-Wordpress-AWS/tree/main/vault). Vault stores secrets centrally, and Ansible fetches these secrets dynamically during deployment, keeping credentials out of the codebase and improving security. The name of the database and the user credentials for the wordpress installation are also stored in Vault KV v2 secrets engine.

## (this is still work in progress...)

### TODO

- Move Mariadb to RDS db.t3.micro
