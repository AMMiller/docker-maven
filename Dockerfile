FROM maven:3.6.3-slim

WORKDIR /tmp

RUN apt update && \
    apt install -y git && \
    apt install -y docker.io && \
    git clone https://github.com/AMMiller/boxfuse.git && \
    pwd && \
    mvn package -f /tmp/boxfuse/pom.xml && \
    pwd && \
    git clone https://github.com/AMMiller/docker-tomcat8.git && \
    pwd && \
    cp docker-tomcat8/Dockerfile boxfuse
    
ENTRYPOINT docker build -t tomcat8_boxfuse boxfuse
