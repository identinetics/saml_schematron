#!/usr/bin/env python
from distutils.core import setup
from setuptools import find_packages
import sys, os

here = os.path.abspath(os.path.dirname(__file__))
README = open(os.path.join(here, 'README.md')).read()

__author__ = 'Rainer Hörbe'
__version__ = '0.3.0'

print('sys.prefix: ' + sys.prefix)
setup(name = 'SAMLSchtron',
      description = 'SAML Metadata Schematron Validator: CLI, API & Web Server',
      long_description = README,
      classifiers = [
          "Development Status :: 4 - Beta",
          "Intended Audience :: Information Technology",
          "License :: OSI Approved :: European Union Public Licence 1.1 (EUPL 1.1)",
          "Programming Language :: Python :: 3 :: Only",
          "Programming Language :: Python :: 3.4",
          "Topic :: System :: Systems Administration",
      ],
      keywords = 'identity federation saml metadata',
      author = __author__,
      author_email = 'rainer@hoerbe.at',
      packages = find_packages(),
      package_data = {
          'rules': ['profiles/*.json', 'schtron_exp/*.sch', 'schtron_src/*.sch'],
          'testdata': ['testdata/*'],
          'xmlschema': ['*.xsd'],
      },
      data_files=[('', ['LICENSE.txt', 'README.md'])],
      include_package_data = True,
      url = 'https://github.com/rhoerbe/saml_schematron',
      version = __version__,
      zip_safe = False,
      install_requires = [
          'Jinja2',
          'lxml',
          'Werkzeug',
      ],
      scripts=["scripts/validate.py", "scripts/start_srv.py"],
)
