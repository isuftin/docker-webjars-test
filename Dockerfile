FROM ubuntu:14.04.3

MAINTAINER Ivan Suftin <isuftin@usgs.gov>

EXPOSE 8080

RUN apt-get update && \
    apt-get install -y git maven wget
    
RUN wget 'http://psg.mtu.edu/pub/apache/tomcat/tomcat-8/v8.0.24/bin/apache-tomcat-8.0.24.tar.gz' && \
    tar xzf apache-tomcat-8.0.24.tar.gz

RUN  git clone https://github.com/isuftin/sample-tomcat.git

RUN cd sample-tomcat/ && \
    mvn clean install && \
    mv target/sample-tomcat-1.0-SNAPSHOT.war /apache-tomcat-8.0.24/webapps/sample-tomcat.war
    
RUN /apache-tomcat-8.0.24/bin/catalina.sh start && tail -F /apache-tomcat-8.0.24/logs/catalina.out
