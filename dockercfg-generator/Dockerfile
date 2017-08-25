FROM codeship/ibm-bluemix-base:latest
LABEL maintainer='Codeship Inc., <maintainers@codeship.com>'

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    apt-transport-https && \
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
  echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" > /etc/apt/sources.list.d/docker.list && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    docker-ce && \
  docker --version && \
  rm -rf /var/lib/apt/lists/*

COPY bluemix_docker_creds.sh /bin
RUN chmod u+x /bin/bluemix_docker_creds.sh

ENTRYPOINT ["bluemix_docker_creds.sh"]
