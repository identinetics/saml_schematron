FROM centos:centos7
MAINTAINER r2h2 <rainer@hoerbe.at>

# CentOS7
RUN yum -y install epel-release \
 && yum -y install curl unzip python-pip python-devel libxslt-devel \
 && yum -y install java-1.8.0-openjdk-devel.x86_64 \
 && pip install Werkzeug \
 && mkdir -p /opt/saml_schematron \
 && groupadd webapp && \
    adduser -g webapp --home /opt/saml_schematron webapp && \
    chown webapp:webapp /opt/saml_schematron && \
    chmod 750 /var/lib/git

USER webapp
WORKDIR /opt/
RUN git clone https://github.com/rhoerbe/saml_schematron.git

# === startup backend system
#USER webapp
#CMD ["/opt/saml_schematron/webapp/validate_srv.py"]
