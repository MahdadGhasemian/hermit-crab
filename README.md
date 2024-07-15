# Hermit Crab

![Hermit Crab](.images/hermit-crab.png)

## Did you know?

Hermit crabs change shells as they grow, always adapting to new infrastructure needs!

## About

Hermit Crab is a project designed to configure, deploy and manage Kubernetes clusters on bare-metal infrastructure using Ansible and Terraform.

## Terraform

```bash
cd terraform
terraform init
terraform apply
terraform output -json > outputs.json

ssh vagrant@192.168.56.10 -p 22
```

## Ansible

```bash
ansible-playbook -i inventory/hosts.ini playbooks/check_connection.yaml


```

## Roadmap

- [ ] Init Terraform To create development infrestrucure on vagrant
- [ ] Write Ansible palybooks

## TODO

- [ ]

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
