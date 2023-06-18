# Use an official Maven image as the builder stage
FROM maven:3.8.4-openjdk-8-slim AS builder

# Set the working directory in the builder stage
WORKDIR /app

# Copy the pom.xml and project files
COPY pom.xml .
COPY src ./src

# Build the application using Maven
RUN mvn package -DskipTests

# Use an OpenJDK image as the final stage
FROM openjdk:8-jdk-alpine

# Set the working directory in the final stage
WORKDIR /app

# Install Maven
RUN apk add --no-cache maven

# Copy the compiled JAR file from the builder stage to the final stage
COPY --from=builder /app/target/test-ipl.jar .

# Expose the port your application listens on
EXPOSE 8080

# Set the startup command for the container
CMD ["java", "-jar", "test-ipl.jar"]
