# !/bin/bash

# check istio folder
folder = "istio"

if [ d "$folder" ]; then
    echo " $folder folder is already present....!"
else
    echo " $folder folder is not present. Downloading...!"
    mkdir -p $folder
    
    if [ $? -eq 0 ]; then
        echo " Istio folder created sucessfully.."
    else
        echo "Istio folder created failure...."
        exit 1
    fi
fi

# check weather istio folder is present or not. if not present then download it.
if ls istio-1.2* 1> /dev/null 2>&1; then
    echo "Istio is already downloaded....!"
else
    echo " $istio folder is not present. Downloading...!"
    curl -L https://istio.io/downloadIstio | sh -
    
    if [ $? -eq 0 ]; then
        echo "Downloaded istio folder sucessfully.."
    else
        echo "Istio folder download failure...."
        exit 1
    fi
fi

# Navigate to bin folder
cd istio-1.2*/bin

# Export the path
export PATH=$PWD:$PATH

# Check Istio CLI is working
istioctl version

# Install Istio with demo profile (ideal for learning)
istioctl install --set profile=demo -y

# Verify Istio is running
kubectl get pods -n istio-system
