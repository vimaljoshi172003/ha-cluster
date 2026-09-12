FROM tomcat:10.1-jdk17

# Remove default webapps to avoid clutter and reduce image size
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy PostgreSQL JDBC driver into Tomcat's shared lib folder
# This allows any webapp deployed in Tomcat to use it for DB connections
COPY lib/postgresql-42.7.4.jar /usr/local/tomcat/lib/postgresql-42.7.4.jar

# ARG lets us pass which app folder (app1 or app2) to use at build time
ARG APP_DIR

# Copy the specific app's index.jsp into Tomcat's ROOT webapp folder
COPY ${APP_DIR}/index.jsp /usr/local/tomcat/webapps/ROOT/index.jsp

EXPOSE 8080
