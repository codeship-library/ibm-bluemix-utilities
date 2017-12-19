FROM ubuntu:xenial
LABEL maintainer='Codeship Inc., <maintainers@codeship.com>'

# see https://clis.ng.bluemix.net/ui/home.html
ARG IBM_CLOUD_VERSION='0.6.3'

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    ca-certificates \
    curl && \
  curl "https://clis.ng.bluemix.net/download/bluemix-cli/${IBM_CLOUD_VERSION}/linux64" > bluemix.tar.gz && \
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
