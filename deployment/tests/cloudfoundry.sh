#!/bin/bash

set -e

# login to IBM Cloud via credentials provided via (encrypted) environment
# variables
bluemix login \
  --apikey "${BLUEMIX_API_KEY}" \
  -a "${BLUEMIX_API_ENDPOINT}" \
  -o "${BLUEMIX_ORGANIZATION}" \
  -s "${BLUEMIX_SPACE}"

# check that the CloudFoundry CLI is available via the Bluemix CLI wrapper
bluemix cf version

# list available CloudFoundry applications
bluemix cf apps

# push the application
#bluemix cf push
