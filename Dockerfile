# Use an official Java 8 runtime as the base image
FROM eclipse-temurin:8u372-b07-jre

# Set the working directory in the builder stage
WORKDIR /app

# Copy the pom.xml and project files
COPY pom.xml .
COPY src ./src

# Build the application using Maven
RUN mvn package -DskipTests

# Use an OpenJDK image as the final stage
FROM eclipse-temurin:8u372-b07-jre

# Set the working directory in the final stage
WORKDIR /app

# Copy the compiled JAR file from the builder stage to the final stage
COPY --from=builder /app/target/test-ipl.jar .

# Expose the port your application listens on
EXPOSE 8080

# Set the startup command for the container
CMD ["java", "-jar", "test-ipl.jar"]
