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
        self.profileoptions = ''
        for display_name in Validator.get_profiles().values():
            self.profileoptions += '<option>' + display_name +  '</option>'

