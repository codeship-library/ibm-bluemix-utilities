#!/bin/bash

set -e

# login to IBM Cloud via credentials provided via (encrypted) environment
# variables
bluemix login \
  --apikey "${BLUEMIX_API_KEY}" \
  -a "${BLUEMIX_API_ENDPOINT}"

bluemix cs init \
  --host "${BLUEMIX_CONTAINER_SERVICE_HOST}"

# Get the required configuration for `kubectl` from Bluemix and load it
bluemix cs cluster-config \
  --export "${BLUEMIX_CONTAINER_SERVICE_CLUSTER_NAME}" \
  > .kubectl_config
source .kubectl_config && rm -rf .kubectl_config

# run the commands required to deploy the application via `kubectl`
kubectl version
kubectl cluster-info
