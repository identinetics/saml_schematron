FROM centos:centos7
MAINTAINER r2h2 <rainer@hoerbe.at>

# CentOS7 + prerequsites
RUN yum -y install epel-release \
 && yum -y install java-1.8.0-openjdk-devel.x86_64 \
 && yum -y install curl gcc git libxslt-devel python-pip python-devel unzip

RUN pip install --upgrade pip \
 && pip install jinja2 subprocess32 Werkzeug

# Application
RUN groupadd webapp \
 && adduser -g webapp webapp \
 && mkdir -p /opt \
 && chmod 750 /opt

WORKDIR /opt/
RUN git clone https://github.com/rhoerbe/saml_schematron.git
ENV XMLSECARC xmlsectool-1.2.0-bin.zip
RUN curl -O http://shibboleth.net/downloads/tools/xmlsectool/latest/$XMLSECARC \
 && unzip $XMLSECARC \
 && chown webapp:webapp /opt
COPY start.sh /
RUN chmod +x /start.sh /opt/saml_schematron/scripts/*.sh /opt/saml_schematron/webapp/*.py

# === startup backend system
#USER webapp
#CMD ["/start.sh"]
