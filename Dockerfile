# Use an official Tomcat base image
FROM tomcat:9.0-jdk11-openjdk-slim

# Remove default webapps to avoid conflicts
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into the Tomcat webapps directory
COPY target/maven-web-app-lab2-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/app.war

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
