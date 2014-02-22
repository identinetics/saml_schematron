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
import ConfigParser
import jinja2
import os
import random
import subprocess

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
        val_out = subprocess.check_output([valscript[validationType], tmpfile])
        #val_out = subprocess.check_output("/bin/echo", "blah")
    except subprocess.CalledProcessError:
        val_out = 'validation failed'
    os.remove(tmpfile)
    html = res_template.render(validationType= validationType, fname=fname, val_out=val_out.replace("\n", "<br/>"))
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

def remove_quotes(s):
    if s.startswith('"') and s.endswith('"'):
        return s[1:-1]
    if s.startswith("'") and s.endswith("'"):
        return s[1:-1]
    return s

# start server
if __name__ == '__main__':
    config = ConfigParser.RawConfigParser()
    config.read('validate_srv.config')

    server_port = config.getint('HttpServer', 'port')
    server_interface = remove_quotes(config.get('HttpServer', 'listen'))
    tempdir = remove_quotes(config.get('Backend', 'tempdir'))
    templatedir = remove_quotes(config.get('Backend', 'templatedir'))
    req_template_file = open(templatedir + '/validate_srv_req.html', 'r')
    req_template = jinja2.Template(req_template_file.read())
    res_template_file = open(templatedir + '/validate_srv_res.html', 'r')
    res_template = jinja2.Template(res_template_file.read())

    scriptdir = remove_quotes(config.get('Backend', 'scriptdir'))
    pvp2schematron = scriptdir + remove_quotes(config.get('Backend', 'pvp2schematron'))
    saml2intschematron = scriptdir + remove_quotes(config.get('Backend', 'saml2intschematron'))
    xsdxmllint = scriptdir + remove_quotes(config.get('Backend', 'xsdxmllint'))
    xsdxmlsectool = scriptdir + remove_quotes(config.get('Backend', 'xsdxmlsectool'))
    valscript = {'SAML XML Schema (xmllint)': xsdxmllint,
                 'SAML XML Schema (xmlsectool)': xsdxmlsectool,
                 'PVP2 Schematron': pvp2schematron,
                 'SAML2INT Schematron': saml2intschematron,
    }

    run_simple(server_interface, server_port, application, use_debugger=True)
