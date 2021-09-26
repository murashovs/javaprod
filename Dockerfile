
FROM tomcat:9.0
RUN apt-get update
RUN apt-get install default-jdk -y
RUN apt-get install maven -y
RUN apt-get install git -y
RUN mkdir /var/boxfuse_src
RUN cd /var/boxfuse_src
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN pwd
RUN cd /var/boxfuse_src/boxfuse-sample-java-war-hello
RUN mvn package
RUN cp /var/boxfuse_src/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps
EXPOSE 80
CMD ["catalina.sh", "run"]
