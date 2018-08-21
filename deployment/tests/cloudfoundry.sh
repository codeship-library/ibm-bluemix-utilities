#!/bin/bash

set -e

# Login to IBM Cloud via credentials provided via encrypted environment variables
ibmcloud login \
  --apikey "${BLUEMIX_API_KEY}" \
  -a "${BLUEMIX_API_ENDPOINT}" \
  -o "${BLUEMIX_ORGANIZATION}" \
  -s "${BLUEMIX_SPACE}"

# Check that the CloudFoundry CLI is available via the IBM Cloud CLI wrapper
ibmcloud cf version

# List available CloudFoundry applications
ibmcloud cf apps

# Push the application
#ibmcloud cf push
