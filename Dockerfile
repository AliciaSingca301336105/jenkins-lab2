# Use an official Maven image to build the application
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .  # Copies the source code into the image
RUN mvn clean package  # Builds the Maven project

# Use Tomcat to run the application
FROM tomcat:9.0
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war  # Copy the WAR file to Tomcat's webapps directory
EXPOSE 8080  # Exposes the port for the web app
CMD ["catalina.sh", "run"]  # Start Tomcat server
