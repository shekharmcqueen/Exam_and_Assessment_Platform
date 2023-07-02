# Use a base image with the desired operating system
FROM ubuntu:20.04

# Install required dependencies

# Update the system packages
RUN apt-get update && apt-get upgrade -y

# Install Java 17
RUN apt-get install -y openjdk-17-jdk






# Install Maven 4.0.0
ENV MAVEN_VERSION=4.0.0
RUN apt-get install -y wget && \
    wget https://apache.osuosl.org/maven/maven-4/4.0.0-alpha-5/binaries/apache-maven-4.0.0-alpha-5-bin.tar.gz && \
    tar -xf apache-maven-${MAVEN_VERSION}-alpha-5-bin.tar.gz && \
    mv apache-maven-${MAVEN_VERSION}-alpha-5 /opt/maven && \
    rm apache-maven-${MAVEN_VERSION}-alpha-5-bin.tar.gz

# Set environment variables for Java and Maven
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:/opt/maven/bin:$PATH

# Set the working directory for the application
WORKDIR /app

# Copy the source code and pom.xml file to the container
COPY src /app/src
COPY pom.xml /app

# Build the application using Maven
RUN mvn clean package

# Start the application
CMD ["java", "-jar", "target/examPortal-0.0.1-SNAPSHOT.jar"]
