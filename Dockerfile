FROM maven:3.6.3-slim

RUN apt update && \
    apt install -y git


CMD mvn