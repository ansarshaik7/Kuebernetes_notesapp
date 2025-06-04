# !/bin/bash

echo "Username: $DOCKER_USERNAME"
echo "Password: $DOCKER_PASSWORD"

kubectl create secret docker-registry notescred \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username="$DOCKER_USERNAME" \
  --docker-password="$DOCKER_PASSWORD" \
  --docker-email="sabasha1485@gmail.com" \
  --namespace=notes-app-ns --dry-run=client -o yaml