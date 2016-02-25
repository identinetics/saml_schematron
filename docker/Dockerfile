FROM centos:centos7
MAINTAINER r2h2 <rainer@hoerbe.at>

# CentOS7 + prerequsites
RUN yum -y install epel-release \
 && yum -y install curl gcc git libxslt-devel python-pip python-devel unzip \
 && yum -y install java-1.8.0-openjdk-devel.x86_64

RUN pip install jinja2 subprocess32 Werkzeug

# Application
RUN groupadd webapp \
 && adduser -g webapp webapp \
 && mkdir /opt/saml_schematron \
 && chown webapp:webapp /opt/saml_schematron \
 && chmod 750 /opt/saml_schematron
USER webapp
WORKDIR /opt/
RUN git clone https://github.com/rhoerbe/saml_schematron.git
ENV XMLSECARC xmlsectool-1.2.0-bin.zip
RUN curl -O http://shibboleth.net/downloads/tools/xmlsectool/latest/$XMLSECARC \
 && unzip $XMLSECARC
COPY start.sh /

# === startup backend system
USER root  # development & test
#CMD ["/start.sh"]
