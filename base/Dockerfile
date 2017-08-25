FROM ubuntu:xenial
LABEL maintainer='Codeship Inc., <maintainers@codeship.com>'

# see https://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/
ARG IBM_BLUEMIX_VERSION='0.5.6'

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    ca-certificates \
    curl && \
  curl "https://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/Bluemix_CLI_${IBM_BLUEMIX_VERSION}_amd64.tar.gz" > bluemix.tar.gz && \
  tar -xzf bluemix.tar.gz && \
  ( cd Bluemix_CLI && ./install_bluemix_cli ) && \
  rm -rf Bluemix_CLI bluemix.tar.gz && \
  rm -rf /var/lib/apt/lists/* && \
  bluemix config --usage-stats-collect false && \
  bluemix --version

RUN \
  bluemix plugin install container-registry -r Bluemix && \
  bluemix plugin install container-service -r Bluemix
