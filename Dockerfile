FROM maven:3.6.3-slim

RUN apt update && \
    apt install -y git 

WORKDIR /tmp

RUN git clone https://github.com/AMMiller/boxfuse.git && \
    mvn package -f /tmp/boxfuse-sample-java-war-hello/pom.xml && \
    git clone https://github.com/AMMiller/docker-tomcat8.git

ENTRYPOINT  docker build -name tomcat8_boxfuse .  