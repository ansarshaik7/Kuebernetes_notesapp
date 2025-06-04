# !/bin/bash

# make ingress directory and copy ingress.yaml file

if [ -d "ingress" ]; then
    echo " the ingress folder is present"
else
    echo " The ingress folder id not presnt...creating te folder"
    mkdir -p ingress
    if [ $? -eq 0 ]; then
        echo "the ingress folder is created sucessfully"
    else
        echo " the creation of ingress folder is failed"
        exit 1
    fi
fi
# copy ingress file
cp ingress.yaml "$WORKSPACE/ingress"
cd "$WORKSPACE/ingress"

# intall the nginx ingress controller
kubectl apply -f https://kind.sigs.k8s.io/examples/ingress/deploy-ingress-nginx.yaml

# # copy ingress file
# cp ingress.yaml /root/ingress

kubectl get pods -n ingress-nginx
kubectl get svc -n ingress-nginx
