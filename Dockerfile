# Use a lightweight Java runtime image
FROM eclipse-temurin:17-jre-alpine

# Set working directory in container
WORKDIR /app

# Copy pom.xml first to leverage caching for dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code and build
COPY src ./src
RUN mvn clean package

# Copy the JAR file from host to container
COPY target/*.jar app.jar

# Run the JAR when container starts
ENTRYPOINT ["java", "-jar", "app.jar"]