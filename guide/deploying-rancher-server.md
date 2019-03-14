# Deploying Rancher Server

Rancher Server will run as a Docker container.

- SSH into the host where the server will run and launch the container:

    ```bash
    docker run -d --restart=unless-stopped \
        -p 80:80 -p 443:443 \
        -v /opt/rancher:/var/lib/rancher \
        rancher/rancher:stable
    ```

## Vagrant

If you ran your Rancher Server using Vagrant and `vagrant up`, when you `vagrant ssh` into the VM, you will be using the `vagrant` user, which does not have permissions to run `docker`. To run `docker run`, you must either first:

- Add the `vagrant` user to the `docker` group - `sudo usermod -aG docker vagrant`, and/or
- `sudo` into `root` - `sudo su -`, or
- Run all `docker` commands with `sudo`
