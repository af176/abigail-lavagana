FROM maven:3.3-jdk-8-alpine as builder

COPY pom.xml /build/
COPY src /build/src/
RUN mvn -Dmaven.test.skip=true clean package

RUN ls /build/target/

FROM openjdk:8-jre-alpine
ENV DB_DIALECT MYSQL 
ENV DB_URL jdbc:mysql://mysqldb:3306/lavagna?autoReconnect=true&useSSL=false
ENV DB_USER root 
ENV DB_PASS "lavagna" 
ENV SPRING_PROFILE prod 

COPY ./entrypoint.sh /build/
COPY ./target /build/
WORKDIR /build/

EXPOSE 8080

RUN apk update && apk add ca-certificates && update-ca-certificates && apk add openssl fontconfig ttf-dejavu


ENTRYPOINT ["sh", "entrypoint.sh"]
