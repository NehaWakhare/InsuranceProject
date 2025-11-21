# -------- STAGE 1: BUILD --------
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy Maven files
COPY pom.xml .
COPY src ./src

# Build the project (skip tests for speed)
RUN mvn clean package -DskipTests

# -------- STAGE 2: RUNTIME --------
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Copy the JAR from build stage (wildcard works for any jar name)
COPY --from=build /app/target/*.jar app.jar

# Expose backend port
EXPOSE 8080

# Run the backend
ENTRYPOINT ["java", "-jar", "app.jar"]
