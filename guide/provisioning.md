# Machine Provisioning

## Vagrant

Clone the repository and deploy the virtual machines

```bash
git clone https://github.com/rancher/rodeo && cd rodeo/vagrant
vagrant up
```

The server where we install rancher will be availiable via SSH.

You can test status and connectivity to the created nodes.  A successful provisioning operation should look like this.

```bash
$ vagrant status
Config: {"default_password"=>"admin", "rancher_version"=>"v2.1.1", "cluster_name"=>"rodeo", "rodeo"=>true, "docker_version"=>{"server"=>"17.03", "node"=>"17.03"}, "server"=>{"cpus"=>1, "memory"=>2000}, "node"=>{"count"=>1, "cpus"=>2, "memory"=>3000}, "ip"=>{"server"=>"172.22.101.101", "node"=>"172.22.101.111"}, "linked_clones"=>true, "net"=>{"private_nic_type"=>"82545EM", "network_type"=>"private_network"}, "roles"=>{"node-01"=>"all"}}

Current machine states:

server-01                 running (virtualbox)
node-01                   running (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
$ vagrant ssh server-01
Config: {"default_password"=>"admin", "rancher_version"=>"v2.1.1", "cluster_name"=>"rodeo", "rodeo"=>true, "docker_version"=>{"server"=>"17.03", "node"=>"17.03"}, "server"=>{"cpus"=>1, "memory"=>2000}, "node"=>{"count"=>1, "cpus"=>2, "memory"=>3000}, "ip"=>{"server"=>"172.22.101.101", "node"=>"172.22.101.111"}, "linked_clones"=>true, "net"=>{"private_nic_type"=>"82545EM", "network_type"=>"private_network"}, "roles"=>{"node-01"=>"all"}}

Welcome to Ubuntu 16.04.5 LTS (GNU/Linux 4.4.0-142-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

4 packages can be updated.
0 updates are security updates.

New release '18.04.1 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


vagrant@server-01:~$ exit
logout
Connection to 127.0.0.1 closed.
$ vagrant ssh node-01
Config: {"default_password"=>"admin", "rancher_version"=>"v2.1.1", "cluster_name"=>"rodeo", "rodeo"=>true, "docker_version"=>{"server"=>"17.03", "node"=>"17.03"}, "server"=>{"cpus"=>1, "memory"=>2000}, "node"=>{"count"=>1, "cpus"=>2, "memory"=>3000}, "ip"=>{"server"=>"172.22.101.101", "node"=>"172.22.101.111"}, "linked_clones"=>true, "net"=>{"private_nic_type"=>"82545EM", "network_type"=>"private_network"}, "roles"=>{"node-01"=>"all"}}

Welcome to Ubuntu 16.04.5 LTS (GNU/Linux 4.4.0-142-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

4 packages can be updated.
0 updates are security updates.

New release '18.04.1 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


vagrant@node-01:~$ exit
logout
Connection to 127.0.0.1 closed.
```

## Digital Ocean

Clone the repository and rename the tfvars file.

```bash
git clone https://github.com/rancher/rodeo && cd rodeo/do
mv terraform.tfvars.example terraform.tfvars
```

Edit terraform.tfvars and then deploy the instances.

```bash
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
