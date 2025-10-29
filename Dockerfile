# ---------- Stage 1: Build the project ----------
FROM maven:3.8.7-openjdk-11 AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# ---------- Stage 2: Deploy WAR on Tomcat ----------
FROM tomcat:9.0-jdk11-temurin
COPY --from=builder /app/target/health-tracker-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
