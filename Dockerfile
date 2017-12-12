FROM 'jenkins/jenkins:slim'
MAINTAINER yasuhiroki

# Install Docker
USER root
RUN apt-get update && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common && \
        add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" && \
        apt-get update && apt-get install -y --allow-unauthenticated docker-ce
RUN usermod -a -G staff jenkins

USER jenkins
COPY ref/config.xml.override /usr/share/jenkins/ref/
COPY ref/nodes /usr/share/jenkins/ref/nodes
COPY ref/jobs /usr/share/jenkins/ref/jobs
COPY plugins.txt /var/jenkins_home/plugins.txt
RUN install-plugins.sh < /var/jenkins_home/plugins.txt
