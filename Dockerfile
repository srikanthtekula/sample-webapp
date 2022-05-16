FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get -y install openjdk-8-jdk wget
RUN apt-get -y install maven
RUN apt install git -y
RUN mkdir /usr/local/tomcat && chmod 775 /usr/local/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.78/bin/apache-tomcat-8.5.78.tar.gz -O /tmp/apache-tomcat-8.5.78.tar.gz
RUN cd /tmp && tar xvfz apache-tomcat-8.5.78.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.78/* /usr/local/tomcat/
RUN sed -i 's/8080/9090/g' /usr/local/tomcat/conf/server.xml
EXPOSE 9090
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
