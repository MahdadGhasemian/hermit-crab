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
cd k3s-ansible
ansible-playbook playbooks/site.yml -i inventory.yml
cp ~/.kube/config ~/.kube/config-copy && cp ~/.kube/config.new ~/.kube/config
kubectl config use-context k3s-ansible
cd ..
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

### Authentications

Argocd authentication:

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

Redis authentication:

```bash
kubectl get secret --namespace redis redis -o jsonpath="{.data.redis-password}" | base64 -d
```

Redis connection:

- host: redis-master
- port: 6379
- username: leave it empty (default)

## Minio

```bash
cd minio-ansible
ansible-galaxy install -r requirements.yml
ansible-playbook playbooks/minio_setup.yml -i inventory.yml
```

Note:

- Minio UI > Configuration > Region > set "us-east-1"
- Minio UI > Access Keys > Create access key (Write down the Access key and Secret Key)
- Minio UI > Buckets > Create Bucket

```yaml
Bucket Name: longhorn
```

- Minio UI > Buckets > choose longhorn bucket > change `Access Policy` to `Public`

- Longhorn UI > Setting > General

```yaml
Backup Target: s3://longhorn@us-east-1/
Backup Target Credential Secret: longhorn-minio-secret
```

- Create and Add secret to kubernetes

```tf
resource "kubernetes_manifest" "longhorn_minio_secret" {
  manifest = {
    apiVersion = "v1",
    kind       = "Secret",
    metadata = {
      name      = "longhorn-minio-secret"
      namespace = "longhorn-system"
    },
    type = "Opaque"
    data = {
      AWS_ACCESS_KEY_ID     = var.longhorn_minio_aws_access_key_id
      AWS_SECRET_ACCESS_KEY = var.longhorn_minio_aws_secret_access_key
      AWS_ENDPOINTS         = var.longhorn_minio_aws_endpoint
    }
  }

  depends_on = [module.longhorn]
}
```

- backup1-always

## Restore Backup

Example: Restoring PostgreSQL Data

1- Scale down the PostgreSql StatefulSet:

```bash
kubectl scale statefulset.apps/postgresql --replicas=0 -n postgresql
```

2- Wait for the volume to be detached

- Monitor the volume status until it is detached.

3- Note the Current Volume Name:

- For example `pvc-1be4dafb-399f-40d4-ac87-205eb56c2f44`.

4- Delete the old Volume via Longhorn GUI.

- Navigate to the longhorn GUI and delete the specified volume.

5- Restore the Backup to a New Volume.

- Use the Longhorn GUI to restore the backup to a new volume with the same name noted in step 3 (`pvc-1be4dafb-399f-40d4-ac87-205eb56c2f44`).

6- Wait for the Rrestore process to complete.

7- Create PV/PVC:

- Navigate to the lonhorn GUI > Volume > at the right side of volume named `pvc-1be4dafb-399f-40d4-ac87-205eb56c2f44` open operation button > select `Create PV/PVC`
- Ensure the `Create PVC` option is checked
- Ensure the `Use Previous PVC` option is checked

8 - Wait until the PV/PVC to be Available.

9- Scale Up the PostgreSQL StatefulSet:

```bash
kubectl scale statefulset.apps/postgresql --replicas=1 -n postgresql
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
