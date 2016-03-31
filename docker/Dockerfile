FROM centos:centos7
MAINTAINER r2h2 <rainer@hoerbe.at>

# CentOS7 + prerequsites
RUN yum -y install epel-release \
 && yum -y install curl git ip lsof net-tools unzip xmlstarlet
RUN yum -y install gcc libxslt-devel python-pip python34-devel \
 && yum -y install java-1.8.0-openjdk-devel.x86_64
RUN yum -y clean all \
 && curl https://bootstrap.pypa.io/get-pip.py | python3.4 \
 && pip3.4 install jinja2 lxml Werkzeug

# Application will run as a non-root user/group that must map to the docker host
ARG USERNAME=schtron
ARG UID=3000
RUN groupadd -g $UID $USERNAME \
 && adduser -g $UID -u $UID $USERNAME \
 && mkdir -p /opt/saml_schematron

WORKDIR /opt/saml_schematron

RUN git clone https://github.com/rhoerbe/saml_schematron.git . \
 && curl -O https://www-eu.apache.org/dist/xalan/xalan-j/binaries/xalan-j_2_7_2-bin-2jars.tar.gz \
 && tar -xzf xalan-j_2_7_2-bin-2jars.tar.gz \
 && rm xalan-j_2_7_2-bin-2jars.tar.gz

RUN ./scripts/make_schtron.sh rules/allrules.sch \
 && ./scripts/make_schtron.sh rules/pvp2.sch \
 && ./scripts/make_schtron.sh rules/saml2int.sch

ENV XMLSECARC xmlsectool-1.2.0-bin.zip
WORKDIR /opt/saml_schematron/lib
RUN curl -O http://shibboleth.net/downloads/tools/xmlsectool/latest/$XMLSECARC \
 && unzip $XMLSECARC \
 && chown -R $USERNAME:$USERNAME /opt/saml_schematron \
 && chmod -R 750 /opt/saml_schematron
COPY start.sh /
RUN chmod +x /start.sh /opt/saml_schematron/scripts/*.sh /opt/saml_schematron/webapp/*.py

# === startup backend system
USER $USERNAME
CMD ["/start.sh"]
