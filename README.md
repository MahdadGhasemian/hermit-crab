# Hermit Crab

![Hermit Crab](.images/hermit-crab.png)

## Did you know?

Hermit crabs change shells as they grow, always adapting to new infrastructure needs!

## About

Hermit Crab is a project designed to configure, deploy and manage Kubernetes clusters on bare-metal infrastructure using Ansible and Terraform.

## Getting Started

First Init project

```bash
./init.sh
```

Second edit the `k3s-ansible/inventory.yml` file to match your cluster setup. For example:

```bash
k3s_cluster:
  children:
    server:
      hosts:
        192.16.35.11:
          host_hostname: server
    agent:
      hosts:
        192.16.35.12:
          host_hostname: agent1
        192.16.35.13:
          host_hostname: agent2
```

If needed, you can also edit `vars` section at the bottom to match your environment.

Start provisioning of the cluster using the following command:

```bash
ansible-playbook k3s-ansible/playbooks/site.yml -i k3s-ansible/inventory.yml
```

Now it's time to edit the `terraform/terraform.tfvars` file to match your kubernetes setup. For example:

```tf
node_labels = {
  "server" = {
    "example.com/custom-label1" = "custom-value1"
    "example.com/custom-label2" = "custom-value2"
  }
  "agent1" = {
    "example.com/another-label" = "another-value"
  }
  "agent2" = {
    "example.com/another-label" = "another-value"
  }
}
traefik_hostname                = "traefik.example.com"
argocd_hostname                 = "argocd.example.com"
longhorn_hostname               = "longhorn.example.com"
redisinsight_hostname           = "redisinsight.example.com"
postgresql_hostname             = "postgresql.example.com"
traefik_users_secret            = "dXNlcjokYXByMSR2T3VaUC54TSRZMVZiL2dlQUNPTEl0bWNodWxHd0YxCgo="
longhorn_users_secret           = "dXNlcjokYXByMSR2T3VaUC54TSRZMVZiL2dlQUNPTEl0bWNodWxHd0YxCgo="
redisinsight_users_secret       = "dXNlcjokYXByMSR2T3VaUC54TSRZMVZiL2dlQUNPTEl0bWNodWxHd0YxCgo="
rabbitmq_admin_password         = "changethispassword1"
rabbitmq_storageclass_name      = "longhorn"
rabbitmq_storage_size           = "2Gi"
redis_storageclass_name         = "longhorn"
redis_storage_size              = "2Gi"
postgresql_storageclass_name    = "longhorn"
postgresql_storage_size         = "2Gi"
postgresql_admin_password       = "changethispassword2"
postgresql_username             = "user"
postgresql_password             = "changethispassword3"
gitlab_certmanager_issuer_email = "your-email@example.com"
```

Run the terraform:

```bash
cd terraform
terraform init
terraform apply
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
