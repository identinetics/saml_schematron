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

import werkzeug.serving
from werkzeug.wrappers import BaseRequest, BaseResponse
from werkzeug.exceptions import HTTPException, NotFound
import jinja2
import os
import random
import subprocess
from config import Config
from validate import ApiArgs, Validator


def get_handler(req):
    return BaseResponse(req_template.render(profileoptions=config.profileoptions),
                        mimetype='text/html')

def post_handler(req):
    file = req.files['md_instance']
    fname = file.filename
    if not fname:
        return BaseResponse('no file uploaded', status=400)
    tmpfile = os.path.join(config.tempdir, fname + '_' + str(random.randrange(99999999)))
    file.save(tmpfile)
    profile_display_name = req.form['md_profile']
    if not profile_display_name in config.profiles.keys():
        return BaseResponse('invalid metadata profile: ' + profile_display_name, status=400)

    profile_file = config.profiles[profile_display_name]
    validator = Validator(ApiArgs(tmpfile, profile=profile_file).cliInvocation)
    validator_result = validator.validate()
    os.remove(tmpfile)
    html = res_template.render(validationType=profile_display_name,
                               fname=fname,
                               val_out=validator_result.message.replace("\n", "<br/>"))
    return BaseResponse(html,
                        mimetype='text/html',
                        direct_passthrough=False)


# WSGI handler
def application(environ, start_response):
    req = BaseRequest(environ)
    if req.method == 'POST':
        resp = post_handler(req)
    elif req.method == 'GET':
        resp = get_handler(req)
    else:
        return BaseResponse('HTTP method not supported', mimetype='text/plain')
    return resp(environ, start_response)


# start server
if __name__ == '__main__':
    config = Config()

    with open(config.templatedir + '/validate_srv_req.html', 'r', encoding="utf-8") as f:
        req_template = jinja2.Template(f.read())
    with open(config.templatedir + '/validate_srv_res.html', 'r', encoding="utf-8") as f:
        res_template = jinja2.Template(f.read())


    werkzeug.serving.run_simple(config.HttpServer['listen'],
               config.HttpServer['port'],
               application,
               use_debugger=True)
