
## Install

Install gitlab-runner on kubernetes
```sh
kubectl create -f ./gitlab-runner.yml
```

## Config GitLab CI

`gitlab-ci.yml`

Must change mount point to docker deamon's volume because of docker in docker (docker in docker in docker actually..)

## Trouble Shooting

* Dont register multi group runner in one runner server, dont change `concurrent = 1` in `/etc/gitlab-runner/config.toml`
  ref: [https://gitlab.com/gitlab-org/gitlab-runner/issues/3688]
