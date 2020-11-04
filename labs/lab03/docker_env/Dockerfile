FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y software-properties-common curl
RUN apt-get install -y openjdk-8-jre-headless

WORKDIR /opt/tomcat

RUN curl -O https://mirrors.up.pt/pub/apache/tomcat/tomcat-9/v9.0.39/bin/apache-tomcat-9.0.39.tar.gz
RUN tar xzf apache-tomcat-9.0.39.tar.gz

COPY entrypoint.sh entrypoint.sh

COPY myapps/* apache-tomcat-9.0.39/webapps

EXPOSE 8080

ENTRYPOINT [ "/bin/bash", "entrypoint.sh" ]