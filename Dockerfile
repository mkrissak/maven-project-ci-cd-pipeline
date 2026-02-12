# Use a lightweight Java runtime image
FROM eclipse-temurin:17-jre-alpine

# Set working directory in container
WORKDIR /app

# Copy the JAR file from host to container
COPY target/my-app-1.0-SNAPSHOT.jar app.jar

# Run the JAR when container starts
ENTRYPOINT ["java", "-jar", "app.jar"]