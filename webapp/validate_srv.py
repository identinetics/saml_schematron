#!/usr/bin/env python
"""
    Simple Validator Service
    ~~~~~~~~~~~~~~~~~~~~~~~~
    
    This script starts up a web server with a page where a SAML metadata file can be uploaded.
    The uploaded file will be validated and returned together with the validation report.

    This service is intended for well-behaved users. To service it in the wild you should add appropriate controls,
    e.g. against DOS and malicious inputs.
   
    Rainer Hoerbe, 2014-02-21

"""
__author__ = "rhoerbe"

from werkzeug.serving import run_simple
from werkzeug.wrappers import BaseRequest, BaseResponse
from werkzeug.exceptions import HTTPException, NotFound
import jinja2
import os
import random
import subprocess
#import config

class Config(object):
    def __init__(self):
        self.HttpServer = {
            'port': 8080,
            'listen': '0.0.0.0'
        }
        self.Backend = {
            # Note: always include trailing slash in directory definitions
            # Directory where files are temporarily stored for valdation
            'tempdir': '/tmp/',
            'templatedir': './',
            'scriptdir': '../scripts/',

            # Scripts for XSD validation
            #'xsdxmllint': 'xsd_validation_xmllint.sh',
            'xsdxmlsectool': 'xsd_validation_xmlsectool.sh',

            # Scripts for Schematron validation
            'pvp2schematron': 'val_pvp2_libxslt_stdout.sh',
            'saml2intschematron': 'val_saml2int_libxslt_stdout.sh',
        }
        for fn in (self.Backend['xsdxmlsectool'],
            self.Backend['pvp2schematron'], ):
            self.check_executable(fn)

    def check_executable(self, fpath):
        fullpath = os.path.join(self.Backend['scriptdir'], fpath)
        if not os.path.isfile(fullpath):
            raise Exception('Cannot find script ' + fullpath)
        if not os.access(fullpath, os.X_OK):
            raise Exception('Cannot execute script ' + fullpath)


def get_handler(req):
    return BaseResponse(req_template.render(), mimetype='text/html')

def post_handler(req):
    file = req.files['md_instance']
    fname = file.filename
    #if not file in req.files:
    #    return BaseResponse('no file uploaded', status=400)
    if not fname:
        return BaseResponse('no file uploaded', status=400)
    tmpfile = tempdir + fname + str(random.randrange(999999999999))
    file.save(tmpfile)
    validationType = req.form['ValidationType']
    if not validationType in valscript:
        return BaseResponse('invalid Validation Type: ' + validationType, status=400)
    try:
        val_out = subprocess.check_output([valscript[validationType], tmpfile]).decode('utf-8')
        #val_out = subprocess.check_output("/bin/echo", "blah")
    except subprocess.CalledProcessError:
        val_out = 'validation failed'
    os.remove(tmpfile)
    # this assumes a platform where the shell is unsing utf-8 (like osx, centos)
    html = res_template.render(validationType=validationType,
                               fname=fname,
                               val_out=val_out.replace("\n", "<br/>"))
    return BaseResponse(html,
                        mimetype='text/html',
                        direct_passthrough=False)


# WSGI handler
def application(environ, start_response):
    req = BaseRequest(environ)
    if req.method == 'POST':
        resp = post_handler(req)
    else:
        resp = get_handler(req)
    return resp(environ, start_response)


# start server
if __name__ == '__main__':
    config = Config()

    tempdir = config.Backend['tempdir']
    templatedir = config.Backend['templatedir']

    with open(templatedir + '/validate_srv_req.html', 'r', encoding="utf-8") as f:
        s = f.read()
        req_template = jinja2.Template(s)
    with open(templatedir + '/validate_srv_res.html', 'r', encoding="utf-8") as f:
        res_template = jinja2.Template(f.read())

    scriptdir = config.Backend['scriptdir']
    pvp2schematron = scriptdir + config.Backend['pvp2schematron']
    saml2intschematron = scriptdir + config.Backend['saml2intschematron']
    #xsdxmllint = scriptdir + config.Backend['xsdxmllint']
    xsdxmlsectool = scriptdir + config.Backend['xsdxmlsectool']
    valscript = {#'SAML XML Schema (xmllint)': xsdxmllint,
                 'SAML XML Schema': xsdxmlsectool,
                 'PVP2 Schematron': pvp2schematron,
                 'SAML2INT Schematron': saml2intschematron,
    }

    run_simple(config.HttpServer['listen'],
               config.HttpServer['port'],
               application,
               use_debugger=True)
