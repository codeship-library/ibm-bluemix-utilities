#!/bin/bash

set -e

: "${BLUEMIX_API_KEY:?Need to set your BLUEMIX_API_KEY}"
: "${BLUEMIX_API_ENDPOINT:=api.ng.bluemix.net}"

# Logging into IBM Cloud
echo "Logging into IBM Cloud"
ibmcloud login --apikey "${BLUEMIX_API_KEY}" -a "${BLUEMIX_API_ENDPOINT}"
ibmcloud cs init
ibmcloud cr login

# Writing IBM Cloud Docker creds to desired path
echo "Writing Docker creds to $1"
chmod 544 ~/.docker/config.json
cp ~/.docker/config.json $1
