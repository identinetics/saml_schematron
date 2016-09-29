#!/usr/bin/env python
from distutils.core import setup
from setuptools import find_packages
import sys, os

readme = '''SAML-Schematron provides additional rules to OASIS SSTC XML schemas to validate metadata against specific
profiles. Users may want to define their own profile-specific rule set reusing existing rules.
The package provides an API, CLI and webs erver.
'''

__author__ = 'Rainer Hörbe'
__version__ = '0.3.3'

print('sys.prefix: ' + sys.prefix)
setup(name = 'SAMLSchtron',
      description = 'SAML Metadata Schematron Validator: CLI, API & Web Server',
      long_description = readme,
      classifiers = [
          "Development Status :: 4 - Beta",
          "Intended Audience :: Information Technology",
          "License :: OSI Approved :: European Union Public Licence 1.1 (EUPL 1.1)",
          "Programming Language :: Python :: 3 :: Only",
          "Programming Language :: Python :: 3.4",
          "Programming Language :: Python :: 3.5",
          "Topic :: System :: Systems Administration",
      ],
      keywords = 'identity federation saml metadata',
      author = __author__,
      author_email = 'rainer@hoerbe.at',
      packages = find_packages(),
      package_data = {
          'rules': ['profiles/*.json', 'schtron_src/*.sch', 'schtron_xsl/*.xsl'],
          'test': ['test_validator.json'],
          'testdata': ['*.xml', '*.json'],
          'xmlschema': ['*.xsd'],
      },
      data_files=[('saml_schtron/webapp/template', ['saml_schtron/webapp/template/validate_srv_req.html',
                                                    'saml_schtron/webapp/template/validate_srv_res.html',]),
                  ('saml_schtron/webapp/static/css', ['saml_schtron/webapp/static/css/color.css',
                                                      'saml_schtron/webapp/static/css/layout.css',
                                                      'saml_schtron/webapp/static/css/reset.css',
                                                      'saml_schtron/webapp/static/css/tables.css',]),
                  ('saml_schtron/webapp/static/html', ['saml_schtron/webapp/static/html/allrules.html',
                                                       'saml_schtron/webapp/static/html/pvp2.html',
                                                       'saml_schtron/webapp/static/html/saml2int.html',
                                                       'saml_schtron/webapp/static/html/wpv.html',]),
                  ('lib', ['lib/pvzdValidateXsd.jar',]),
                  ],
      include_package_data = True,
      url = 'https://github.com/rhoerbe/saml_schematron',
      version = __version__,
      zip_safe = False,

      install_requires = [
          #'jnius', # py3.x version need to be installed from pyjnius repo -> see docker_samlschematron@github
          #'javabridge', # only required if pyjnius is not used (PYJNIUS_ACTIVATE not set -> fallback)
          'Jinja2>=2.8',
          'lxml>=3.6.0',
          'MarkupSafe>=0.23',
          'Werkzeug>=0.11.4',
      ],
      scripts=["scripts/validate.py",
               "scripts/start_srv.py",
               "scripts/val_schtron.sh",
               "scripts/val_xsd.sh",
               ],
)
