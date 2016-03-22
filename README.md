# An ElasticSearch running inside docker.

A Docker container for setting up ElasticSearch. This server can respond to search requests.

Elasticsearch is an open-source, broadly-distributable, readily-scalable, enterprise-grade search engine. Accessible through an extensive and elaborate API, Elasticsearch can power extremely fast searches that support your data discovery applications.

This container best suites development purposes.

This is a sample ElasticSearch docker container used to test Wordpress installation on [http://www.globalfoodbook.com](http://www.globalfoodbook.com)


To build this elasticsearch server run the following command:

```bash
$ docker pull globalfoodbook/elasticsearch
```

This will run on a default port of 9200.

To run the server and expose it on port 9200 of the host machine, run the following command:

```bash
$ docker run --name=elasticsearch --detach=true --publish=9200:9200 --publish=9300:9300 elasticsearch

```

# NB:

## Before pushing to docker hub

## Login

```bash
$ docker login
```

## Build

```bash
$ cd /to/docker/directory/path/
$ docker build -t <username>/<repo>:latest .
```

## Push to docker hub

```bash
$ docker push <username>/<repo>:latest
```


IP=`docker inspect elasticsearch | grep -w "IPAddress" | awk '{ print $2 }' | head -n 1 | cut -d "," -f1 | sed "s/\"//g"`
HOST_IP=`/sbin/ifconfig eth1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`

DOCKER_HOST_IP=`awk 'NR==1 {print $1}' /etc/hosts` # from inside a docker container
