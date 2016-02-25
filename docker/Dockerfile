FROM centos:centos7
MAINTAINER r2h2 <rainer@hoerbe.at>

# CentOS7 + prerequsites
COPY RPM-GPG-KEY-EPEL-7 /etc/pki
RUN yum -y install epel-release
RUN yum -y install java-1.8.0-openjdk-devel.x86_64
RUN yum -y install curl gcc git libxslt-devel python-pip python-devel unzip \

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
