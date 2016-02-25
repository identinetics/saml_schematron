#!/usr/bin/env python
"""
    Simple Validator Application
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
    Rainer Hoerbe, 2014-02-21

"""
__author__ = "rhoerbe"

from werkzeug.serving import run_simple
from werkzeug.wrappers import BaseRequest, BaseResponse
from werkzeug.wsgi import wrap_file


def view_file(req):
    if not 'md_instance' in req.files:
        return BaseResponse('no file uploaded')
    f = req.files['md_instance']
    return BaseResponse(wrap_file(req.environ, f), mimetype=f.content_type,
                        direct_passthrough=True)


def upload_file(req):
    return BaseResponse('''
    <h1>SAML Metadata Validation Service</h1>
    <form action="" method="post" enctype="multipart/form-data">
        <input type="file" name="md_instance">
        <input type="submit" value="Upload">
    </form>
    ''', mimetype='text/html')


def application(environ, start_response):
    req = BaseRequest(environ)
    if req.method == 'POST':
        resp = view_file(req)
    else:
        resp = upload_file(req)
    return resp(environ, start_response)


if __name__ == '__main__':
    run_simple('localhost', 8088, application, use_debugger=True)
