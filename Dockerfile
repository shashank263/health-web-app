# Use a Tomcat 9 base image with JDK 11
FROM tomcat:9.0-jdk11-temurin

# Copy the .war file from the Maven build into the Tomcat webapps directory
COPY target/health-tracker.war /usr/local/tomcat/webapps/ROOT.war

# Expose the Tomcat port
EXPOSE 8080

# Start Tomcat when the container runs
CMD ["catalina.sh", "run"]