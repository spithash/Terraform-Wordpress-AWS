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
- community.hashi_vault 6.2.0
```

### Install requirements

```bash
ansible-galaxy collection install community.hashi_vault amazon.aws community.mysql
```
