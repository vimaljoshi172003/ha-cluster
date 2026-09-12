FROM tomcat:9.0-jdk17

# Remove default webapps to avoid clutter and reduce image size
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy PostgreSQL JDBC driver into Tomcat's shared lib folder
COPY lib/postgresql-42.7.4.jar /usr/local/tomcat/lib/postgresql-42.7.4.jar

# Copy Redis Session Manager dependency jars into Tomcat's shared lib folder
COPY lib/tomcat-cluster-redis-session-manager-4.0.jar /usr/local/tomcat/lib/
COPY lib/jedis-3.0.1.jar /usr/local/tomcat/lib/
COPY lib/commons-pool2-2.6.2.jar /usr/local/tomcat/lib/
COPY lib/slf4j-api-1.7.26.jar /usr/local/tomcat/lib/

# Copy Redis connection properties into Tomcat's conf folder
COPY conf/redis-data-cache.properties /usr/local/tomcat/conf/redis-data-cache.properties

# Replace Tomcat's default context.xml with our custom one (adds Redis Valve + Manager)
COPY conf/context.xml /usr/local/tomcat/conf/context.xml

# ARG lets us pass which app folder (app1 or app2) to use at build time
ARG APP_DIR

# Copy the specific app's index.jsp into Tomcat's ROOT webapp folder
COPY ${APP_DIR}/index.jsp /usr/local/tomcat/webapps/ROOT/index.jsp
COPY ${APP_DIR}/health.jsp /usr/local/tomcat/webapps/ROOT/health.jsp

EXPOSE 8080
