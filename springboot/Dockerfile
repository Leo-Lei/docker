FROM ubuntu:16.04
MAINTAINER Lei Wei <leiwei2094@gmail.com>
ENV REFRESHED_AT 2017-04-17
RUN apt-get update && apt-get install -y openjdk-8-jdk
COPY app.sh /opt/app.sh
CMD bash /opt/app.sh
