FROM  adoptopenjdk/openjdk11:jre-11.0.11_9-alpine
VOLUME /tmp

COPY build/libs/demo-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]