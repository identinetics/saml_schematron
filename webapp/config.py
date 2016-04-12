import os
from validate import ApiArgs, Validator


class Config(object):
    def __init__(self):
        self.HttpServer = {
            'port': 8080,
            'listen': '0.0.0.0'
        }
        self.templatedir = './'
        self.tempdir = '/tmp'
        # setup list of available profiles
        self.profiles = {}
        validator = Validator(ApiArgs(listprofiles=True).cliInvocation)
        for profile in validator.get_profiles():
            self.profiles[profile['name']] = profile['file']
        self.profileoptions = ''
        for profile in validator.get_profiles():
            self.profileoptions += '<option>' + profile['name'] +  '</option>'

