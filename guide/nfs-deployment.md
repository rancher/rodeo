# Building an NFS StorageClass Provisioner

## Part One: Deploying the NFS Server

On the Rancher Server, make a directory to hold persistent data, and then share that directory via an NFS server container:

```bash
sudo apt -qq -y install nfs-kernel-server

sudo systemctl stop nfs-kernel-server

sudo systemctl disable nfs-kernel-server

sudo mkdir -p /opt/nfs

sudo docker run -d --name nfs --restart=always \
  --privileged --net=host -v /opt/nfs:/exports -e \
  SHARED_DIRECTORY=/exports itsthenetwork/nfs-server-alpine:4
```

If you haven't already opened port 2049/tcp on the server, do so now in your security policy configuration.

## Part Two: Deploying the Provisioner

In the Rancher UI, Select the System project and create a new Namespace called `nfs-client-provisioner`.

Next, import the `provisioner.yaml` file from the k8s folder in the `rancher/rodeo` github repository. Change the NFS server address in both places to match your NFS server location.

Verify the installation was successful:

```bash
$ kubectl -n nfs-client-provisioner get po
NAME                                      READY     STATUS    RESTARTS   AGE
nfs-client-provisioner-865b7bc646-n7zjs   1/1       Running   0          2m
```
