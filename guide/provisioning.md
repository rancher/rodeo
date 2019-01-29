# Machine Provisioning

## Vagrant

Clone the repository and deploy the virtual machines

```
git clone https://github.com/rancher/rodeo && cd rodeo/vagrant
vagrant up
```

The Rancher Server will be available at <https://172.22.101.101>

## Digital Ocean

Clone the repository and rename the tfvars file.

```
git clone https://github.com/rancher/rodeo && cd rodeo/do
mv terraform.tfvars.example terraform.tfvars
```

Edit terraform.tfvars and then deploy the instances.

```
terraform init
terraform apply
```

This will:

- Start a droplet for the server
- Start `{count_agent_all_nodes}` amount of droplets for Kubernetes

## AWS

Clone the repository and rename the tfvars file.

```bash
git clone https://github.com/rancher/rodeo && cd rodeo/aws
mv terraform.tfvars.example terraform.tfvars
```

Edit terraform.tfvars and then deploy the instances.

```bash
terraform init
terraform apply
```

This will:

- Start an EC2 instance for the server
- Start `{count_agent_all_nodes}` amount of EC2 instances for Kubernetes
