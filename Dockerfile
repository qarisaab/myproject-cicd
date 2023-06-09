FROM openjdk:8-jre-alpine

EXPOSE 8080

COPY ./build/libs/ /usr/app/
WORKDIR /usr/app

ENTRYPOINT ["java", "-jar", "java-app-1.0-SNAPSHOT.jar"]
