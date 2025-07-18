This is the default policy file for the Vault's KV (Key-Value) secrets engine mount. In our case this is called `wordpress_deployment`

This deployment requires you to have vault access token to a local or remote Vault server. In our case this is `127.0.0.1`

### Creating the `terraform` policy

```bash
vault policy write terraform terraform.hcl
```

### Creating a token that _uses_ this policy

```bash
vault token create -policy="terraform"
```
