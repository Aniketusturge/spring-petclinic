# Use a base image with OpenJDK
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Install Maven
RUN apt-get update 
RUN apt-get install -y maven 
RUN apt-get clean 
RUN rm -rf /var/lib/apt/lists/*

# Copy the project files into the container
COPY . .

# Expose the port
EXPOSE 8080

# Package the application using Maven
RUN ./mvnw package

# Set the command to run the application
CMD ["java", "-jar", "target/spring-petclinic-3.3.0-SNAPSHOT.jar"]
