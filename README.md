# Quickstart examples for Rancher

## Summary

This repo contains scripts that will allow you to quickly deploy instances for use during a Rancher Rodeo.

The contents aren't intended for production but are here to get you up and running quickly during the rodeo session, either with DO, AWS, or Vagrant.

## DO / AWS Quickstart

The `do` folder and `aws` folder each contain Terraform scripts to stand up an instance for the Rancher Server and a configurable number of instances for the Kubernetes nodes. By default this number is set to one but can be set with `count_agent_all_nodes` in the `terraform.tfvars` file.

### How to use

- Clone this repository and go into the corresponding subfolder for your provider
- Move the file `terraform.tfvars.example` to `terraform.tfvars` and edit (see inline explanation)
- Run `terraform init`
- Run `terraform apply`

When provisioning has finished you will have instances that you can use to deploy Rancher Server and Kubernetes.

### How to Remove

To remove the VMs that have been deployed run `terraform destroy --force`

**Please be aware that you will be responsible for the usage charges with Digital Ocean and Amazon Web Services**

## Vagrant Quickstart

The `vagrant` folder contains the configuration to deploy a single VM for the Rancher Server and one or more VMs for the Kubernetes cluster. By default this number is set to one but can be changed by adjusting `count` under `node` in `config.yaml`.

If you set `rodeo` to `false` in `config.yaml` the installation will provision a complete Rancher Server and Kubernetes cluster all at once. Use this to redeploy a Vagrant cluster quickly.

The prerequistes for this are [vagrant](https://www.vagrantup.com) and [virtualbox](https://www.virtualbox.org), installed on the PC you intend to run it on, and 6GB free memory

### How to Use

- Clone this repository and go into the `vagrant` subfolder
- Edit `config.yaml` to set any values for the installation
- Run `vagrant up`

When provisioning is finished the Rancher Server will be available via SSH at `172.22.101.101` and the nodes will be available on sequential IPs starting at `172.22.101.111`. If you set `rodeo` to `false`, the Rancher Server UI will be available at https://172.22.101.101/.

### How to Remove

To remove the VMs that have been deployed run `vagrant destroy -f`. The configuration uses linked clones, so if you want to destroy the origin instance, open the VirtualBox Manager and remove the base `ubuntu-xenial` instance left behind.
