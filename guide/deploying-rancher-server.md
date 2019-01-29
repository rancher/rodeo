# Deploying Rancher Server

Rancher Server will run as a Docker container.

- SSH into the host where the server will run and launch the container:

    ```bash
    docker run -d --restart=unless-stopped \
        -p 80:80 -p 443:443 \
        -v /opt/rancher:/var/lib/rancher \
        rancher/rancher:stable
    ```
