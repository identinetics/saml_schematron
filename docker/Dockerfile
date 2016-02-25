FROM centos:centos7
MAINTAINER r2h2 <rainer@hoerbe.at>

# CentOS7 + prerequsites
RUN yum -y install epel-release \
 && yum -y install curl git libxslt-devel python-pip python-devel unzip \
 && yum -y install java-1.8.0-openjdk-devel.x86_64 \
 && groupadd webapp \
 && adduser -g webapp webapp \
 && mkdir /opt/saml_schematron \
 && chown webapp:webapp /opt/saml_schematron \
 && chmod 750 /opt/saml_schematron

RUN pip install Werkzeug jinja2

# Application
USER webapp
WORKDIR /opt/
RUN git clone https://github.com/rhoerbe/saml_schematron.git

# === startup backend system
USER root
#CMD ["/start.sh"]
