FROM centos:centos7
MAINTAINER Prashant Singh prashant.vicky@gmail.com

ENV KIBANA_VERSION 6.2.2

RUN \
  rpm --rebuilddb && yum clean all && \
  yum install -y tar java-1.8.0-openjdk && \
  yum clean all && \
  mkdir -p /opt/kibana && \
  cd /opt/kibana && \
  curl -o /tmp/kibana4.tgz https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz && \
  tar zxvf /tmp/kibana4.tgz -C /opt/kibana --strip-components=1 && \
  rm -f /tmp/kibana4.tgz

ENV KIBANA_CONFIG=/opt/kibana/config/kibana.yml \
    MARVEL_SUPPORT=false

EXPOSE 5601

ENTRYPOINT ["/bootstrap.sh"]
