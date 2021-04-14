#
# Build stage -
#
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage - arm64
#

FROM arm64v8/openjdk
VOLUME /tmp
COPY target/springboot-backend-0.0.1-SNAPSHOT.jar springboot-homelab.jar
ENTRYPOINT ["java","-jar","/springboot-homelab.jar"]
