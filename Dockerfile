

# Stage 1: Build the application with Maven
# This stage uses a full JDK to build the JAR file
FROM maven:3.8.5-openjdk-8-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml file to download dependencies
COPY pom.xml .

# Download all dependencies. This is a separate layer to leverage Docker's caching.
RUN mvn dependency:go-offline

# Copy the rest of your source code
COPY src ./src

# Package the application, skipping tests as they should be run in a previous CI step
RUN mvn package -DskipTests


# Stage 2: Create the final, lightweight runtime image
# This stage uses only the Java Runtime Environment (JRE) to run the application
FROM openjdk:8-jre-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file from the 'build' stage into the final image
# You MUST replace 'ProjectAutomation-1.0-SNAPSHOT.jar' with the actual name of your JAR file.
# You can find this in your pom.xml (<artifactId>-<version>.jar)
COPY --from=build /app/target/ProjectAutomation-1.0-SNAPSHOT.jar /app/app.jar

# Expose the port your application runs on (if any, e.g., 8080 for a web app)
# EXPOSE 8080

# The command to run your application when the container starts
ENTRYPOINT ["java", "-jar", "/app/app.jar"]


