
## Install

Install gitlab-runner on kubernetes
```sh
kubectl create -f ./gitlab-runner.yml
```

## Config GitLab CI

`gitlab-ci.yml`

Must change mount point to docker deamon's volume because of docker in docker (docker in docker in docker actually..)
