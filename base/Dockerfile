FROM ubuntu:xenial
LABEL maintainer='Codeship Inc., <maintainers@codeship.com>'

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates \
    curl && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*

# see https://clis.ng.bluemix.net/ui/home.html
ARG IBM_CLOUD_VERSION='0.6.4'

RUN \
  curl "https://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/${IBM_CLOUD_VERSION}/IBM_Cloud_CLI_${IBM_CLOUD_VERSION}_amd64.tar.gz" > bluemix.tar.gz && \
  tar -xzf bluemix.tar.gz && \
  ( cd Bluemix_CLI && ./install_bluemix_cli ) && \
  rm -rf Bluemix_CLI bluemix.tar.gz && \
  rm -rf /var/lib/apt/lists/* && \
  bluemix config --usage-stats-collect false && \
  bluemix config --check-version false && \
  bluemix --version

RUN \
  bluemix plugin install container-registry -r Bluemix && \
  bluemix plugin install container-service -r Bluemix
