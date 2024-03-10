FROM ubuntu:latest

# Update package lists and install wget
RUN apt-get update && apt-get install -y wget

# Download and install OpenJDK 17
RUN apt-get install -y openjdk-17-jdk maven

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and the project files to the container
COPY pom.xml .
COPY . .

# Build the application using Maven
RUN mvn clean package -DskipTests


# Set the command to run the application
CMD ["java", "-jar", "./target/psic-proj-0.0.1.jar"]