#!/usr/bin/env python
"""
    Simple Validator Service
    ~~~~~~~~~~~~~~~~~~~~~~~~
    
    This script starts up a web server with a page where a SAML metadata file can be uploaded.
    The uploaded file will be validated and the validation report is returned.

    Rainer Hoerbe, 2014-02-21

"""
__author__ = "rhoerbe"

from werkzeug.wrappers import BaseRequest, BaseResponse
from werkzeug.exceptions import HTTPException, NotFound
from werkzeug.utils import secure_filename
import jinja2
import os
import random
from saml_schtron.validator import ApiArgs, Validator

class AppHandler():

    def __init__(self, config):
        with open(os.path.join(config.templatedir, 'validate_srv_req.html'), 'r', encoding="utf-8") as f:
            self.req_template = jinja2.Template(f.read())
        with open(os.path.join(config.templatedir, 'validate_srv_res.html'), 'r', encoding="utf-8") as f:
            self.res_template = jinja2.Template(f.read())
        self.config = config
        self.p_dict = Validator.get_profiles()
        self.p_keys = Validator.get_profiles().keys()
        self.p_reverse = {}
        for (k, v) in Validator.get_profiles().items():
            self.p_reverse[v] = k


    def get_handler(self, req):
        return BaseResponse(self.req_template.render(profileoptions=self.config.profileoptions),
                            mimetype='text/html')

    def post_handler(self, req):
        file = req.files['md_instance']
        fname = filename = secure_filename(file.filename)
        if not fname:
            return BaseResponse('no file uploaded', status=400)
        tmpfile = os.path.join(self.config.tempdir, fname + '_' + str(random.randrange(99999999)))
        file.save(tmpfile)
        # webservice client uses md_profile_key; browser uses md_profile
        if 'md_profile_key' in req.form:
            profile_key = secure_filename(req.form['md_profile_key'])
            profile_display_name = self.p_dict[profile_key]
            api_call = True
        elif 'md_profile' in req.form:
            profile_display_name = req.form['md_profile']
            if not profile_display_name in self.p_reverse:
                return BaseResponse('invalid metadata profile: ' + profile_display_name, status=400)
            profile_key = self.p_reverse[profile_display_name]
            api_call = False
        else:
            return BaseResponse('missing argument profile key', status=400)
        profile_file = profile_key + '.json'
        validator = Validator(ApiArgs(tmpfile, profile=profile_file).cliInvocation)
        if profile_key not in self.p_dict.keys():
            return BaseResponse('invalid profile key: ' + profile_key + ', need: ' + ', '.join(self.p_keys), status=400)
        validator_result = validator.validate()
        os.remove(tmpfile)
        json = ''.join(validator_result.get_json()) + '\n'
        if api_call:
            return BaseResponse(json,
                                mimetype='application/json',
                                direct_passthrough=False)
        else:
            html = self.res_template.render(validationType=profile_display_name,
                                           fname=fname,
                                           val_out=json.replace("\n", "<br/>"))
            return BaseResponse(html,
                                mimetype='text/html',
                                direct_passthrough=False)

    # WSGI handler
    def application(self, environ, start_response):
        req = BaseRequest(environ)
        if req.method == 'POST':
            resp = self.post_handler(req)
        elif req.method == 'GET':
            resp = self.get_handler(req)
        else:
            return BaseResponse('HTTP method not supported', mimetype='text/plain')
        return resp(environ, start_response)
