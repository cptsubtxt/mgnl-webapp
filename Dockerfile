# ----------------------------------------------------------
# Magnolia Docker Image
# ----------------------------------------------------------
#
# https://hub.docker.com/_/tomcat
FROM tomcat:9.0-jdk21-openjdk-slim

ENV JAVA_OPTS="-Dmagnolia.home=/opt/magnolia -Dmagnolia.resources.dir=/opt/magnolia -Dmagnolia.update.auto=true -Dmagnolia.author.key.location=/opt/magnolia/activation-key/magnolia-activation-keypair.properties"

# Copy Tomcat setenv.sh
#COPY src/main/docker/tomcat-setenv.sh $CATALINA_HOME/bin/setenv.sh
#RUN chmod +x $CATALINA_HOME/bin/setenv.sh

# This directory is used for Magnolia property "magnolia.home"
RUN mkdir /opt/magnolia
RUN chmod 755 /opt/magnolia

ARG ARTIFACT_VERSION

RUN rm -rf $CATALINA_HOME/webapps/ROOT
COPY /Users/jannis.wienert/Documents/04_Development/magnolia/ce-tech-previews/ce-tech-previews-webapp/target/war/work/info.magnolia/magnolia-empty-webapp/*.war $CATALINA_HOME/webapps/ROOT.war