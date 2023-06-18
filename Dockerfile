# Use an official Java 8 runtime as the base image
FROM eclipse-temurin:8u372-b07-jre

# Set the working directory in the container
WORKDIR /app

# Copy the compiled JAR file into the container
COPY target/*.jar .

# Expose the port your application listens on
EXPOSE 8080

# Set the startup command for the container
CMD ["java", "-jar", "ipl-0.0.1-SNAPSHOT.jar"]
