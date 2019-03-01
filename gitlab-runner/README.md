
## Install gitlab-runner for kubernetes
ConfigMap Installation is buggy during my installation, do not use it for now(26/02/2019)

```sh
kubectl create -f ./executor-kubernetes.yml
```

## Config .gitlab-ci.yml

Must change mount point to docker deamon's volume because of docker in docker (docker in docker in docker actually..)
