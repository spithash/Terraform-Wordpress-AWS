Run the initial command to generate the inventory_dynamic.yml file

```
ansible-playbook main.yml

```

### Start provisioning

```
ansible-playbook nginx.yml

```

### Ansible collection requirements

```bash
- amazon.aws            10.1.0
- community.hashi_vault 7.0.0
```

### Install requirements

```bash
ansible-galaxy collection install community.hashi_vault amazon.aws community.mysql
```

### $VAULT_TOKEN

I personally am using $VAULT_TOKEN variable for this deployment. You can check yours with 'echo $VAULT_TOKEN'. Alternatively, you can:

```bash
export VAULT_TOKEN=your_token_2341234123e123
```
