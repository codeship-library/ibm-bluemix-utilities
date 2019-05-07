FROM ubuntu:bionic
LABEL maintainer='Codeship Inc., <maintainers@codeship.com>'

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates \
    curl && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*

# https://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli
ARG IBM_CLOUD_VERSION='0.15.1'

RUN \
  curl "https://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/${IBM_CLOUD_VERSION}/IBM_Cloud_CLI_${IBM_CLOUD_VERSION}_amd64.tar.gz" > bluemix.tar.gz && \
  tar -xzf bluemix.tar.gz && \
  ( cd Bluemix_CLI && ./install_bluemix_cli ) && \
  rm -rf Bluemix_CLI bluemix.tar.gz && \
  rm -rf /var/lib/apt/lists/* && \
  ibmcloud config --usage-stats-collect false && \
  ibmcloud config --check-version false && \
  ibmcloud --version

RUN \
  ibmcloud plugin install container-registry -r Bluemix && \
  ibmcloud plugin install container-service -r Bluemix
