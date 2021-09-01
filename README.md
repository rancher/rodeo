# Rancher Rodeo Helm Chart Repository

This repository contains Helm charts that are used during Rancher Rodeo webinars and for demonstration purposes.

**The Helm charts in this repository are not production ready and are meant for demonstration purposes only!**

### How to Use

Helm CLI:

```shell
helm repo add rodeo https://rancher.github.io/rodeo
```

Rancher:

* Go to the Apps Marketplace in Rancher
* Add a new Chart Repository to the HTTP(S) URL `https://rancher.github.io/rodeo` without authentication

### How to Contribute

Create a pull request to the master branch. Make sure to bump the chart version in the Chart.yaml. Once the pull request is merged, a Github Action workflow will automatically build and package a new release of the changed charts and publish them to the chart repository.
