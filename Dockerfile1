FROM eclipse-temurin:8u372-b07-jre
EXPOSE 8080
ARG JAR_FILE=target/ipl-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]