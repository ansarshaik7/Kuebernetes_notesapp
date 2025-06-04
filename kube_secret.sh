# !/bin/bash

echo "Username: $DOCKER_USERNAME"
echo "Password: $DOCKER_PASSWORD"

kubectl create secret docker-registry notescred \
  --docker-username=$DOCKER_USERNAME \
  --docker-password=$DOCKER_PASSWORD \
  --docker-email=sabasha1485@gmail.com \
  --namespace=notes-app
