Run the initial command to generate the inventory_dynamic.yml file

```
ansible-playbook main.yml

```

```
ansible-playbook nginx.yml

```

### Ansible collection requirements

``

- amazon.aws 10.1.0
- community.hashi_vault 6.2.0
  ``

### Install requirements

```
ansible-galaxy collection install community.hashi_vault amazon.aws
```
