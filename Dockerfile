# Use an official Tomcat base image with JDK 11
FROM tomcat:9.0-jdk11-openjdk-slim

# Remove default webapps to avoid conflicts
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into the Tomcat webapps directory
COPY target/maven-web-app-lab2-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/app.war

# Expose the default Tomcat port
EXPOSE 8080

# Set environment variable to prevent Tomcat from running in the background
ENV CATALINA_OPTS="-Djava.awt.headless=true"

# Start Tomcat
CMD ["catalina.sh", "run"]
