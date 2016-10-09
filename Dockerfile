#
# ElasticSearch Dockerfile
#
# https://github.com/dockerfile/elasticsearch
#

# Pull base image.
FROM java:7
MAINTAINER Ikenna N. Okpala <me@ikennaokpala.com>
# Install ElasticSearch.
# i.e
# BUILD_DATE `date -u +"%Y-%m-%dT%H:%M:%SZ"`
# VCS_REF `git rev-parse --short HEAD`
LABEL org.label-schema.build-date=$BUILD_DATE \
       org.label-schema.docker.dockerfile="/Dockerfile" \
       org.label-schema.license="GNU GENERAL PUBLIC LICENSE" \
       org.label-schema.name="Elasticsearch Container (gfb)" \
       org.label-schema.url="http://globalfoodbook.com/" \
       org.label-schema.vcs-ref=$VCS_REF \
       org.label-schema.vcs-type="Git" \
       org.label-schema.vcs-url="https://github.com/globalfoodbook/elasticsearch.git"

RUN \
  cd /tmp && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.1.tar.gz && \
  tar xvzf elasticsearch-1.3.1.tar.gz && \
  rm -f elasticsearch-1.3.1.tar.gz && \
  mv /tmp/elasticsearch-1.3.1 /elasticsearch

# Define mountable directories.
VOLUME ["/elasticsearch/logs"]
VOLUME ["/elasticsearch/data"]

# Define working directory.
WORKDIR /data

RUN \
  /elasticsearch/bin/plugin -install elasticsearch/elasticsearch-cloud-aws/2.3.0

RUN \
  /elasticsearch/bin/plugin -install mobz/elasticsearch-head

# Define default command.
CMD ["/elasticsearch/bin/elasticsearch"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
