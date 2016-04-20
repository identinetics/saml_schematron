import os
from saml_schtron.validator import ApiArgs, Validator

class Config(object):
    def __init__(self):
        self.HttpServer = {
            'port': 8080,
            'listen': '0.0.0.0'
        }
        self.templatedir = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'template')
        self.tempdir = '/tmp'
        # setup list of available profiles
        self.profiles = {}
        validator = Validator(ApiArgs(listprofiles=True).cliInvocation)
        for profile in validator.get_profiles():
            self.profiles[profile['name']] = profile['file']
        self.profileoptions = ''
        for profile in validator.get_profiles():
            self.profileoptions += '<option>' + profile['name'] +  '</option>'

