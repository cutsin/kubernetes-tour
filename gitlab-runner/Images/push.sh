# Get Version
TAG=`cat ./package.json | awk 'BEGIN{FS="\""}/"version": "(.+)",/{print $4}'`
# Get Environment
export `cat ./.env | grep DOCKER`

if [ "$DOCKER_REPO_PROJ" = "" ]
then
  echo 'No $DOCKER_REPO_PROJ specified.' && exit 1
fi

IMAGE_LATEST=$DOCKER_REPO_PROJ:latest
IMAGE=$DOCKER_REPO_PROJ:$TAG

# EXIST=`docker images -f 'reference=$CURRENT' | grep $IMAGE`

# Currently, docker-compose is unable to single build as specified target (it will building whole services)

docker-compose build --pull service

docker tag $IMAGE_LATEST $IMAGE

docker push $IMAGE
docker push $IMAGE_LATEST
docker rmi $IMAGE $IMAGE_LATEST
