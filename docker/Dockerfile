FROM centos:centos7
MAINTAINER r2h2 <rainer@hoerbe.at>

# CentOS7 + prerequsites
RUN yum -y install epel-release \

RUN yum -y install java-1.8.0-openjdk-devel.x86_64

RUN yum -y install curl gcc git libxslt-devel python-pip python-devel unzip

RUN yum -y install python34-devel \
 && curl https://bootstrap.pypa.io/get-pip.py | python3.4 \
 && pip3.4 install jinja2 Werkzeug

# Application will run as a non-root user/group that must map to the docker host
ARG USERNAME
ARG UID
RUN groupadd -g $UID $USERNAME \
 && adduser -g $UID -u $UID $USERNAME \
 && mkdir -p /opt \
 && chmod 750 /opt

WORKDIR /opt/
RUN yum -y clean all
RUN git clone https://github.com/rhoerbe/saml_schematron.git
ENV XMLSECARC xmlsectool-1.2.0-bin.zip
RUN curl -O http://shibboleth.net/downloads/tools/xmlsectool/latest/$XMLSECARC \
 && unzip $XMLSECARC \
 && chown $USERNAME:$USERNAME /opt
COPY start.sh /
RUN chmod +x /start.sh /opt/saml_schematron/scripts/*.sh /opt/saml_schematron/webapp/*.py

# === startup backend system
USER $USERNAME
CMD ["/start.sh"]
