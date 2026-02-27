# Use Tomcat with Java 21 (compatible with your compiled classes)
FROM tomcat:10.1.24-jdk21-temurin

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file as ROOT app
COPY chess1.war /usr/local/tomcat/webapps/ROOT.war

# Render provides PORT env variable, Tomcat must use it
RUN sed -i 's/port="8080"/port="${PORT:-8080}"/g' /usr/local/tomcat/conf/server.xml

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
