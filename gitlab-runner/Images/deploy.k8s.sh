# Get Version
TAG=${TAG:-`cat ./package.json | awk 'BEGIN{FS="\""}/"version": "(.+)",/{print $4}'`}
# Get Environment
export `cat ./.env | grep DOCKER`

IMAGE=$DOCKER_REPO_PROJ:$TAG
K8S_NAMESPACE=${K8S_NAMESPACE:-default}
K8S_RESOURCE=${K8S_RESOURCE:-deployment}
K8S_RESOURCE_NAME=${K8S_RESOURCE_NAME:-$CI_PROJECT_NAME}

echo $IMAGE $K8S_NAMESPACE $K8S_RESOURCE $K8S_RESOURCE_NAME

kubectl patch -n $K8S_NAMESPACE daemonset $K8S_RESOURCE_NAME -p '{"spec":{"template":{"spec":{"containers":[{"name":"'$K8S_RESOURCE_NAME'","image":"'$IMAGE'"}]}}}}'
