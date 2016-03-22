#
# ElasticSearch Dockerfile
#
# https://github.com/dockerfile/elasticsearch
#

# Pull base image.
FROM java:7
MAINTAINER Ikenna N. Okpala <me@ikennaokpala.com>
# Install ElasticSearch.
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
