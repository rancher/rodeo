# Using `kubectl` to Upgrade a Workload

Use the following commands to upgrade your rodeo deployment to a different image.

```
kubectl set image deploy/rodeo rodeo=apache:alpine
kubectl get pods
kubectl rollout status deploy/rodeo
```