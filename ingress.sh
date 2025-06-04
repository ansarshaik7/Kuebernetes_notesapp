#!/bin/bash

# Create ingress folder if it doesn't exist
if [ -d ""$WORKSPACE/ingress"" ]; then
    echo "The ingress folder is present"
else
    echo "The ingress folder is not present... creating the folder"
    mkdir -p "$WORKSPACE/ingress"
    if [ $? -eq 0 ]; then
        echo "The ingress folder was created successfully"
    else
        echo "The creation of the ingress folder failed"
        exit 1
    fi
fi

# Copy ingress.yaml
cp ingress.yaml "$WORKSPACE/ingress"
cd "$WORKSPACE/ingress"

# Install nginx ingress controller
kubectl apply -f https://kind.sigs.k8s.io/examples/ingress/deploy-ingress-nginx.yaml

# Validate
kubectl get pods -n ingress-nginx
kubectl get svc -n ingress-nginx