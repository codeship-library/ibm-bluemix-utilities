#!/bin/bash

set -e

# Login to IBM Cloud via credentials provided via encrypted environment variables
ibmcloud login \
  --apikey "${BLUEMIX_API_KEY}" \
  -a "${BLUEMIX_API_ENDPOINT}"

ibmcloud cs init \
  --host "${BLUEMIX_CONTAINER_SERVICE_HOST}"

# Get the required configuration for `kubectl` from IBM Cloud and load it
ibmcloud cs cluster-config \
  --export "${BLUEMIX_CONTAINER_SERVICE_CLUSTER_NAME}" \
  > .kubectl_config
source .kubectl_config && rm -rf .kubectl_config

# Run the commands required to deploy the application via `kubectl`
kubectl version
kubectl cluster-info
